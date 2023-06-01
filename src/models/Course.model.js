let DatabaseModel = require('./Database.model');

class CourseModel extends DatabaseModel {
    static async getAllCourse() {
        let sql = 'select * from Course';
        return await DatabaseModel.querySql(sql);
    }

    static async addCourse(imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse) {
        let sql = `insert into Course (imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse) values ('${imageCourseLink}', '${titleCourse}', '${contentCourse}', '${describeCourse}', '${priceCourse}');`
        await DatabaseModel.querySql(sql);
    }


}

// console.log(CourseModel.getAllCourse().then(data => console.log(data)));
module.exports = CourseModel;