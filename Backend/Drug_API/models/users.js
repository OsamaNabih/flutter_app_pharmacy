module.exports = {
    insertUser: 'INSERT INTO Users set ?',
    getUserByEmail: `SELECT *
                    FROM Users
                    WHERE user_email = ?`,
    getUserById: `SELECT * 
             FROM Users 
             WHERE user_id = ?`,
    getUserWithTypeById: `SELECT *
                        FROM Users NATURAL JOIN User Types
                        WHERE user_id = ?`,
    getTotalSpent: 'SELECT SUM(`Total Cost`) as total_spent FROM `Users Orders` WHERE user_id = ?'
}
