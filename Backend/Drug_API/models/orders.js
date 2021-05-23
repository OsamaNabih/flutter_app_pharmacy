module.exports = {
    getOrder: 'SELECT order_id, drug_id, drug_name, drug_description, order_drug_quantity, drug_price, (drug_price*order_drug_quantity) as order_cost FROM Orders NATURAL JOIN `Order Drugs` JOIN Drugs ON order_drug_id = drug_id WHERE order_id = ?',
    getAllOrders: 'SELECT * FROM Orders NATURAL JOIN `Order Status`',
    getUserOrders: 'SELECT order_id, order_status_name, order_date, order_note, order_status_name FROM `Users Orders` WHERE user_id = ?',
    //getUserOrders: 'SELECT order_id, order_date, order_status, order_note, FROM Orders NATURAL JOIN `Order Status` WHERE user_id = ?',
    //getOrderCost: 'SELECT user_id, order_id, order_date, order_status_name, SUM(drug_price*order_drug_quantity) as `Total Cost` FROM (Drugs JOIN (Orders NATURAL JOIN `Order drugs`) ON drug_id = order_drug_id) NATURAL JOIN `Order Status`  WHERE order_id = ?',
    getOrderCost: 'SELECT `Total Cost` FROM `Users Orders` WHERE order_id = ?',
    //getTotalOrdersCostForUser: 'SELECT SUM(`Total Cost`) as total_spent FROM `Users Orders` WHERE user_id = ?',
    //getUserOrders: 'SELECT * FROM Orders NATURAL JOIN `Order Status` WHERE user_id = ?',

    getOrderDrugs: 'SELECT drug_id, drug_name, drug_price, order_drug_quantity, (drug_price*order_drug_quantity) as order_cost, drug_company_name as manufacturer FROM Drugs JOIN `Order Drugs` ON order_drug_id = drug_id NATURAL JOIN `Drug Companies` WHERE order_id = ? ',

    getAllOrdersByUser: 'SELECT user_id, order_id, user_name, order_date, order_status_name, `Total Cost`, order_note FROM `Users Orders` NATURAL JOIN Users WHERE user_id = ?'
}