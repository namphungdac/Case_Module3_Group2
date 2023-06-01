const qs = require('qs');
const BaseFunctionController = require('./BaseFunction.controller');
const CourseModel = require('../models/Course.model');
const UserModel = require('../models/User.model');

class CustomerPageController {
    static async getCustomerHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/customer/customerHomePage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async getCustomerCoursePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let courseInfoDatabase = await CourseModel.getAllCourse();
        let courseHtml = '';
        courseInfoDatabase.forEach(course => {
            courseHtml += `<div class="card text-center">
            <img class="card-img-top" src="${course.imageCourseLink}" height="300px" width="180px" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/Khoahoc1">${course.titleCourse}</a></h5>
                <p class="card-text">${course.contentCourse}</p>
                <p class="card-text"><h5>Giá khoá học: ${course.priceCourse.toLocaleString()} VND</h5></p>
            </div>
            <button type="button"  class="btn btn-primary">BUY</button>
            </div>`;
        });
        let htmlCustomerCoursePage = await BaseFunctionController.readFileHTML('./src/views/customer/customerCoursePage.html');
        htmlCustomerCoursePage = htmlCustomerCoursePage.replace('{Course}', courseHtml);
        htmlCustomerCoursePage = htmlCustomerCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlCustomerCoursePage);
        res.end();
    }


}

module.exports = CustomerPageController;