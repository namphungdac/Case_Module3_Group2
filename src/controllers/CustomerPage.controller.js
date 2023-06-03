const BaseFunctionController = require('./BaseFunction.controller');
const CourseModel = require('../models/Course.model');

class CustomerPageController {
    static async getCustomerHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/customer/HomePage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }
    static async getAboutHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/customer/AboutPage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }
    static async getContactHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/customer/ContactPage.html');
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
            courseHtml += `<form method="post"> <div class="card text-center">
            <img class="card-img-top" src="${course.imageCourseLink}" height="300px" width="180px" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/customerBuyCourse?courseID=${course.courseID}">${course.titleCourse}</a></h5>
                <p class="card-text">${course.contentCourse}</p>
                <p class="card-text"><h5>Giá khoá học: ${course.priceCourse.toLocaleString()} VND</h5></p>
            </div>
            </div> </form>`;
        });
        let htmlCustomerCoursePage = await BaseFunctionController.readFileHTML('./src/views/customer/CoursePage.html');
        htmlCustomerCoursePage = htmlCustomerCoursePage.replace('{Course}', courseHtml);
        htmlCustomerCoursePage = htmlCustomerCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlCustomerCoursePage);
        res.end();
    }

    static async handleCourseInfo(req, res) {
        if (req.method === 'GET') {

        } else {
            let data = '';
            req.on()
        }
    }


}

module.exports = CustomerPageController;