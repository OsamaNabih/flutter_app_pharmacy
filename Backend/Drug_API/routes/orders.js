const router = require('express').Router();
const order_controller = require('../controllers/orders.js');
const user_controller = require('../controllers/users');
const { checkToken } = require('../auth/token_validation')
//const urlencodedParser = bodyParser.urlencoded({extended: false});

router.route('/')
    .get(order_controller.getOrders);

router.route('/all')
    .get(order_controller.getAllOrders);

router.route('/:order_id')
    .get(order_controller.getOrder);

router.route('/user/:user_id')
    .get(order_controller.getAllOrdersByUser);

router.route('/user/:user_id/drugs')
    .get(user_controller.getUserOrders);



module.exports = router;