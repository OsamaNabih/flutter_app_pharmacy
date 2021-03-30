module.exports = {
    getDrugsByCategory: `SELECT *
                        FROM DRUGS
                        WHERE drug_category_id = ?`,
    getAllDrugs: `SELECT *
                FROM DRUGS`,
    getAllDrugsByCategory: 'SELECT * FROM DRUGS JOIN `Drug Categories` ON drug_category_id = category_id;'
}