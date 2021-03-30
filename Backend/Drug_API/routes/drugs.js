const router = require('express').Router();
const drug_controller = require('../controllers/drugs.js');
const { checkToken } = require('../auth/token_validation');

router.route('/by_category')
    .get(drug_controller.getCategoriesAndDrugsByCategory);

module.exports = router;