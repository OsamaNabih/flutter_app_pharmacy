const mysql = require('mysql');

class Database {
    constructor( db_config ) {
        this.connection = mysql.createConnection( db_config );
    }
    query( sql, args ) {
        return new Promise( ( resolve, reject ) => {
            this.connection.query( sql, args, ( err, rows ) => {
                if ( err )
                    return reject( err );
                resolve( rows );
            } );
        } );
    }
    close() {
        return new Promise( ( resolve, reject ) => {
            if (this.state() == 'disconnected') 
                resolve();
            this.connection.end( err => {
                if ( err )
                    return reject( err );
                resolve();
            } );
        } );
    }
    state() {
        return this.connection.state;
    }
}

module.exports = {
    getDatabase: (DBconfig) => {
        var db = new Database(DBconfig)
        return db
      },
    Database: Database
}
