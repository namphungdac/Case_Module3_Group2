let DatabaseModel = require('./Database.model');

class CustomerModel extends DatabaseModel {
    static async getCustomerIDByUserEmail(userEmail) {
        let sql = `call get_customerID_by_userEmail('${userEmail}');`;
        return await DatabaseModel.querySql(sql);
    }

}

module.exports = CustomerModel;