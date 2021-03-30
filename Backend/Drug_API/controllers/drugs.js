const drug_model = require('../models/drugs');
const category_model = require('../models/categories');
const db_config = require('../config/keys').db_config;
const getDatabase = require('../config/db').getDatabase;
const Database = require('../config/DB');
const v8 = require('v8');

const structuredClone = obj => {
  return v8.deserialize(v8.serialize(obj));
};

module.exports = {
    getAllDrugs: async(req, res, next) => {
        const db = getDatabase(db_config);
        try {
            let drugs = await db.query(drug_model.getAllDrugs);
            db.close();
            return res.status(200).json({drugs: drugs});
        }
        catch (err) {
            db.close();
            return next(err);
        }
    },
    getCategoriesAndDrugsByCategory: async(req, res, next) => {
        const db = getDatabase(db_config);
        try {
            let categories = await db.query(category_model.getCategories);
            if (categories.length == 0) {
                err = 'There are no existing categories';
                return next(err);
            }

            //Doing multiple queries asynchronously may be faster than doing the partitioning logic in the backend
            
            let promises = [];

            for(let category of categories) {
                let promise = db.query(drug_model.getDrugsByCategory, category.category_id);
                promises.push(promise);
            }

            promises = await Promise.all(promises).then(async (result) => {
                db.close();
                return result;
            });

            //Deep copy the categories object
            let category_drugs = categories;
            for(let i = 0; i < promises.length; i++) {
                category_drugs[i]['drugs'] = promises[i];
            }

            data = {
                category_drugs: category_drugs
            };
            
            return res.status(200).json({message: 'Success', drugs_by_cat: data});
        } catch(err) {
            db.close();
            return next(err);
        }
    }
}