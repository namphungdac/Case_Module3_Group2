let DatabaseModel = require('./Database.model');

class CourseModel extends DatabaseModel {
    static async getAllCourse() {
        let sql = 'select * from Course';
        return await DatabaseModel.querySql(sql);
    }

}

// console.log(CourseModel.getAllCourse().then(data => console.log(data)));
module.exports = CourseModel;