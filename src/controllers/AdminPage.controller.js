const qs = require('qs');
const BaseFunctionController = require('./BaseFunction.controller');
const CourseModel = require('../models/Course.model');
const UserModel = require('../models/User.model');

class AdminPageController {
    static async getAdminHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/admin/adminHomePage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email)
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

    // static async getAdminCoursePage(req, res) {
    //     let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
    //     let courseInfoDatabase = await CourseModel.getAllCourse();
    //     let courseHtml = '';
    //     courseInfoDatabase.forEach(course => {
    //         courseHtml += `<div class="card text-center">
    //         <img class="card-img-top" src="${course.imageCourseLink}" height="284px" width="160px" alt="Card image cap">
    //         <div class="card-body">
    //             <h5 class="card-title"><a href="/KH1">${course.titleCourse}</a></h5>
    //             <p class="card-text">${course.contentCourse}</p>
    //         </div>
    //         <button type="button" class="btn btn-primary">Edit</button>
    //         <button type="button" class="btn btn-danger">Delete</button>
    //     </div>`;
    //     });
    //     let htmlAdminCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/adminCoursePage.html');
    //     htmlAdminCoursePage = htmlAdminCoursePage.replace('{Course}', courseHtml);
    //     htmlAdminCoursePage = htmlAdminCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
    //     res.writeHead(200, {'Context-type': 'text/html'});
    //     res.write(htmlAdminCoursePage);
    //     res.end();
    // }
    //
    // static async getAdminAddCoursePage(req, res) {
    //     let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
    //     let htmlAdminAddCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/adminAddCoursePage.html');
    //     htmlAdminAddCoursePage = htmlAdminAddCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
    //     res.writeHead(200, {'Context-type': 'text/html'});
    //     res.write(htmlAdminAddCoursePage);
    //     res.end();
    // }



}

module.exports = AdminPageController;