let DatabaseModel = require('./Database.model');

class CourseModel extends DatabaseModel {
    static async getAllCourse() {
        let sql = 'select * from Course;';
        return await DatabaseModel.querySql(sql);
    }

    static async getCourseByCourseID(courseID) {
        let sql = `select * from Course where courseID = ${courseID};`;
        return await DatabaseModel.querySql(sql);
    }

    static async getCourseIDByUserEmail(userEmail) {
        let sql = `call get_courseID_by_userEmail('${userEmail}');`;
        return await DatabaseModel.querySql(sql);
    }

    static async addCourse(imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse,teacher,times) {
        let sql = `insert into Course (imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse,teacher,times) values ('${imageCourseLink}', '${titleCourse}', '${contentCourse}', '${describeCourse}', '${priceCourse}','${teacher}', '${times}');`;
        await DatabaseModel.querySql(sql);
    }

    static async deleteCourseByCourseID(courseID) {
        let sql = `delete from Course where courseID = ${courseID};`;
        await DatabaseModel.querySql(sql);
    }

    static async updateCourseByCourseID(imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse, courseID) {
        let sql = `UPDATE Course SET imageCourseLink = '${imageCourseLink}', titleCourse = '${titleCourse}', contentCourse = '${contentCourse}', describeCourse = '${describeCourse}', priceCourse = '${priceCourse}' WHERE courseID = '${courseID}';`;
        await DatabaseModel.querySql(sql);
    }

    static async getImageCourseLinkByCourseID(courseID) {
        let sql = `select imageCourseLink from Course where courseID = ${courseID};`;
        return await DatabaseModel.querySql(sql);
    }

}

// console.log(CourseModel.getAllCourse().then(data => console.log(data)));
module.exports = CourseModel;