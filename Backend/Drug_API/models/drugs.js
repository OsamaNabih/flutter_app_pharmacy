module.exports = {
    getDrugsByCategory: `SELECT *
                        FROM DRUGS
                        WHERE drug_category_id = ?`,
    getAllDrugs: 'SELECT drug_id, drug_name, drug_company_name, drug_price, drug_quantity, category_name, type_name FROM DRUGS NATURAL JOIN `Drug Companies` JOIN `Drug Categories` ON category_id = drug_category_id JOIN `Drug Types` ON type_id = drug_type_id',
    getAllDrugsByCategory: 'SELECT * FROM DRUGS JOIN `Drug Categories` ON drug_category_id = category_id;'
}