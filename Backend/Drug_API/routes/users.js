const router = require('express').Router();
const user_controller = require('../controllers/users');
const { checkToken } = require('../auth/token_validation')
//const urlencodedParser = bodyParser.urlencoded({extended: false});
router.route('/register')
    .post(user_controller.registerUser);

router.route('/:id')
    .get(checkToken, user_controller.getUserById);

router.route('/:user_id/orders')
    .get(user_controller.getUserOrders);


router.route('/login')
    .post(user_controller.loginUser);


module.exports = router;