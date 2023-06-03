let DatabaseModel = require('./Database.model');

class OrdersModel extends DatabaseModel {
    static async addOrder(orderDate, customerID) {
        let sql = `insert into Orders (orderDate, customerID) values ('${orderDate}', '${customerID}');`
        await DatabaseModel.querySql(sql);
    }

    static async addOrderDetail(orderID, courseID) {
        let sql = `insert into OrderDetail (orderID, courseID) values ('${orderID}', '${courseID}');`
        await DatabaseModel.querySql(sql);
    }

    static async getOrderIDByUserEmail(userEmail) {
        let sql = `call get_orderID_by_userEmail('${userEmail}');`
        return await DatabaseModel.querySql(sql);
    }

}

module.exports = OrdersModel;