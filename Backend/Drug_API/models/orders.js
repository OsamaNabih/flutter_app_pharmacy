module.exports = {
    getAllOrders: 'SELECT * FROM Orders NATURAL JOIN `Order Status`',
    getUserOrders: 'SELECT order_id, order_status_name, order_date, order_note FROM `Users Orders` WHERE user_id = ?',
    //getUserOrders: 'SELECT order_id, order_date, order_status, order_note, FROM Orders NATURAL JOIN `Order Status` WHERE user_id = ?',
    //getOrderCost: 'SELECT user_id, order_id, order_date, order_status_name, SUM(drug_price*order_drug_quantity) as `Total Cost` FROM (Drugs JOIN (Orders NATURAL JOIN `Order drugs`) ON drug_id = order_drug_id) NATURAL JOIN `Order Status`  WHERE order_id = ?',
    getOrderCost: 'SELECT `Total Cost` FROM `Users Orders` WHERE order_id = ?',
    getTotalOrdersCostForUser: 'SELECT SUM(`Total Cost`) FROM `Users Orders` WHERE user_id = ?',
    //getUserOrders: 'SELECT * FROM Orders NATURAL JOIN `Order Status` WHERE user_id = ?',
    getOrderDrugs: 'SELECT * FROM Drugs JOIN `Order Drugs` ON order_drug_id = drug_id WHERE order_id = ?',
    getAllOrdersByUser: 'SELECT user_id, order_id, user_name, order_date, order_status_name, `Total Cost`, order_note FROM `Users Orders` NATURAL JOIN Users WHERE user_id = ?'
}