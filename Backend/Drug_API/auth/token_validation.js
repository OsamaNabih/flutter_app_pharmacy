const { verify } = require('jsonwebtoken');
require('dotenv')

module.exports = {
    checkToken: (req, res, next) => {
        let token = req.get('Authorization');
        if (token) {
            token = token.slice(7); //truncate the bearing part of format Bearer:<token>
            console.log(token);
            verify(token, process.env.jwt_secret, (err, decoded) => {
                if (err) {
                    res.status(400).json({message: "Invalid token"});
                }
                else {
                    req.token = token;
                    next();
                }
            });
        }
        else {
            res.status(403).json({message: "Unauthorized access"});
        }
    }
}