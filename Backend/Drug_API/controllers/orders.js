const order_model = require('../models/orders');
const db_config = require('../config/keys').db_config;
const getDatabase = require('../config/db').getDatabase;
const Database = require('../config/DB');

module.exports = {
    getAllOrders: async(req, res, next) => {
        const db = getDatabase(db_config);
        try {
            let orders = await db.query(order_model.getAllOrders);
            console.log(orders);
            return res.status(200).json({orders: orders});
        }
        catch(err) {
            db.close();
            return next(err);
        }
    },
    getAllOrdersByUser: async(req, res, next) => {
        const db = getDatabase(db_config);
        try {
            let orders = await db.query(order_model.getAllOrdersByUser, req.params.id);
            console.log(orders);
            return res.status(200).json({orders: orders});
        }
        catch(err) {
            db.close();
            return next(err);
        }
    }
}