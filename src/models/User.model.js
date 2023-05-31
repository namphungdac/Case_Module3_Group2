let DatabaseModel = require('./Database.model');

class UserModel extends DatabaseModel {
    static async getAllUser() {
        let sql = 'select * from User';
        return await DatabaseModel.querySql(sql);
    }

    static async addUser(userEmail, userPassword, role) {
        let sql = `insert into User (userEmail, userPassword, role) values ('${userEmail}', '${userPassword}', '${role}');`
        await DatabaseModel.querySql(sql);
    }

    static async addCustomer(customerName, customerAddress, customerAge) {
        let sql = `insert into Customer (customerName, customerAddress, customerAge) values ('${customerName}', '${customerAddress}', ${customerAge});`
        await DatabaseModel.querySql(sql);
    }

}


// console.log(UserModel.getAllUser().then((data) => console.log(data)));

module.exports = UserModel;

