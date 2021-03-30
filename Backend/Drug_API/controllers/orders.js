const order_model = require('../models/orders');
const db_config = require('../config/keys').db_config;
const getDatabase = require('../config/db').getDatabase;
const Database = require('../config/DB');

module.exports = {
    getAllOrdersWithUsers: async(req, res, next) => {
        const db = getDatabase(db_config);
        try {
            let orders = await db.query(order_model.getAllOrdersWithUsers, '');
            console.log(orders);
            return res.status(200).json({orders: orders});
        }
        catch(err) {
            db.close();
            return next(err);
        }
    }
}