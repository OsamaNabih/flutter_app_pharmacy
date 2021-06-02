const user_model = require('../models/users');
const order_model = require('../models/orders');
const db_config = require('../config/keys').db_config;
const Database = require('../config/db').Database;
const getDatabase = require('../config/db').getDatabase;
const bcrypt = require('bcrypt');
const { sign } = require('jsonwebtoken');
require('dotenv');
const v8 = require('v8');

const structuredClone = obj => {
  return v8.deserialize(v8.serialize(obj));
};

module.exports = {
    registerUser: async(req, res, next) => {
        const db = await getDatabase(db_config);
        try {
            const salt = await bcrypt.genSalt(10);
            const password_hash = await bcrypt.hash(req.body.user_password, salt);            
            let exists = await db.query(user_model.getUserByEmail, req.body.user_email);
            if (exists.length > 0) {
                err = 'A user already exists with this email';
                return next(err);
            }
            req.body.user_type_id = req.body.user_type_id != null ? req.body.user_type_id : 1;
            req.body.user_password = password_hash;
            if (req.files[0])
            {
                req.body['user_image_path'] = req.files[0].path;
            }
            else
            {
                req.body['user_image_path'] = "Images/default-avatar.png";
            }
            let result = await db.query(user_model.insertUser, req.body);
            db.close();
            delete req.body['user_password'];
            let user_id = result['insertId']
            req.body.user_id = user_id;
            
            const jsontoken = sign({ user_id: user_id}, process.env.jwt_secret, {
                expiresIn: '72h'
            });
            return res.status(201).json({
                message: "Registered successfully",
                user_name: req.body.user_name,
                user_type: "1", 
                token: jsontoken,
            });
        } catch(err) {
            console.log(err);
            db.close();
            return next(err);
        }
        
    },
    loginUser: async(req, res, next) => {
        const db = await getDatabase(db_config);
        try {      
            console.log(req.body);
            console.log(typeof(req.body));      
            let exists = await db.query(user_model.getUserWithTypeByEmail, req.body.user_email);  
            db.close();
            if (exists.length == 0) {
                console.log('Invalid email or password');
                err = 'Invalid email or password';
                return next(err);
            }
            const result = await bcrypt.compare(req.body.user_password, exists[0].user_password);
            if (result) {
                result.password = undefined;
                const jsontoken = sign({ user_id: exists[0].user_id}, process.env.jwt_secret, {
                    expiresIn: '72h'
                });
                console.log('Logged in successfully');
                console.log(exists[0]);
                return res.status(200).json({
                    message: 'Logged in successfully',
                    token: jsontoken,
                    user_name: exists[0].user_name,
                    user_type: exists[0].user_type_name
                });
            } 
            else {
                return res.status(500).json({
                    message: 'Login failed'
                });
            }
        } catch(err) {
            db.close();
            return next(err);
        }
        
    },
    getUserById: async(req, res, next) => {
        const db = await getDatabase(db_config);
        try {            
            let user = await db.query(user_model.getUserById, req.params.id);
            db.close();
            console.log(user);
            user[0]['user_address'] = 'El dokki';
            return res.status(200).send(user[0]);
        }
        catch (err) {
            db.close();
            return next(err);
        }
    },
    getUserOrders: async (req, res, next) => {
        const db = await getDatabase(db_config);
        try {
            let orders = await db.query(order_model.getUserOrders, req.params.user_id);

            let promises = [];
            
            for(let i = 0; i < orders.length; i++) {
                promises[i] = db.query(order_model.getOrderDrugs, orders[i].order_id);
            }

            let total_spent = await db.query(user_model.getTotalSpent, req.params.user_id);
            
            promises = await Promise.all(promises).then(async (result) => {
                db.close();
                return result;
            });
            
            for(let i = 0; i < promises.length; i++) {
                orders[i]['drugs'] = promises[i];
            }
            
            let data = {
                total_spent: total_spent[0].total_spent,
                order_drugs: orders
            };

            //console.log(result);
            return res.status(200).send(data);
        }
        catch (err) {
            db.close();
            return next(err);
        }
    }
}