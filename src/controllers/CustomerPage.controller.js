const BaseFunctionController = require('./BaseFunction.controller');
const CourseModel = require('../models/Course.model');
const OrderModel = require('../models/Orders.model');
const CustomerModel = require('../models/Customer.model');
const qs = require("qs");
const url = require("url");

class CustomerPageController {
    static async getHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/customer/HomePage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }
    static async getAboutPage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/customer/AboutPage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }
    static async getContactPage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/customer/ContactPage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async getCoursePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let courseInfoDatabase = await CourseModel.getAllCourse();
        let courseHtml = '';
        courseInfoDatabase.forEach(course => {
            courseHtml += `<form method="post"> <div class="card text-center">
            <a href="buy/course?id=${course.courseID}" ><img class="card-img-top" src="${course.imageCourseLink}" height="300px" width="180px" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="buy/course?id=${course.courseID}">${course.titleCourse}</a></h5>
                <p class="card-text">${course.contentCourse}</p>
                <p class="card-text"><h5>Giá khoá học: ${course.priceCourse.toLocaleString()} VND</h5></p>
            </div>
            </div> </form>`;
        });
        let htmlCoursePage = await BaseFunctionController.readFileHTML('./src/views/customer/CoursePage.html');
        htmlCoursePage = htmlCoursePage.replace('{Course}', courseHtml);
        htmlCoursePage = htmlCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlCoursePage);
        res.end();
    }

    static async getCourseToBuyPage(req, res, courseID) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let courseInfoDatabase = await CourseModel.getCourseByCourseID(courseID);
        let courseHtml = '';
        courseInfoDatabase.forEach(course => {
            courseHtml += `<form method="post">
                    <div class="bg-primary mb-5 py-3">
                        <h3 class="text-white py-3 px-4 m-0">Course Features</h3>
                        <div class="d-flex justify-content-between border-bottom px-4">
                            <h6 class="text-white my-3">Tên </h6>
                            <h6 class="text-white my-3">${course.titleCourse}</h6>
                        </div>
                        <div class="d-flex justify-content-between border-bottom px-4">
                            <h6 class="text-white my-3">Giáo viên </h6>
                            <h6 class="text-white my-3">${course.teacher}</h6>
                        </div>
                        <div class="d-flex justify-content-between  px-4">
                            <h6 class="text-white my-3">Thời gian</h6>
                            <h6 class="text-white my-3">${course.times}</h6>
                        </div>
                        <h5 class="text-white py-3 px-4 m-0">Course Price: ${course.priceCourse.toLocaleString()} ¥</h5>
                        <div class="py-3 px-4">
                            <button type="submit" class="btn btn-block btn-secondary py-3 px-5" href="">Buy
                            </button>
                        </div>
                    </div>
                </form>`
        });

        let advertising = '';
        courseInfoDatabase.forEach(course => {
            advertising += `<div class="mb-5">
                    <div class="section-title position-relative mb-5">             
                        <h1 class="display-4">${course.titleCourse}</h1>
                    </div>
                    <img class="img-fluid rounded w-100 mb-4" src="${course.imageCourseLink}" alt="Image">
                    <h4>${course.contentCourse}</h4>
                    <hr>
                </div>`
        });

        let htmlCourseToBuy = await BaseFunctionController.readFileHTML('./src/views/customer/CourseToBuy.html');
        htmlCourseToBuy = htmlCourseToBuy.replace('{courseInfoToBuy}', courseHtml);
        htmlCourseToBuy = htmlCourseToBuy.replace('{Advertising}', advertising);
        htmlCourseToBuy = htmlCourseToBuy.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlCourseToBuy);
        res.end();
    }

    static async buyCourse(req, res, courseID) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let userEmail = JSON.parse(userLoginInfo.toString()).email;
        console.log(userEmail);
        let orderID = await OrderModel.getOrderByUserEmail(userEmail);
        console.log(orderID)
        if (!orderID) {
            let customerID = await CustomerModel.getCustomerIDByUserEmail(userEmail);
            await OrderModel.addOrder(new Date().toLocaleDateString(), customerID);
            await OrderModel.addOrderDetail(orderID, courseID);
        } else {
            await OrderModel.addOrderDetail(orderID, courseID);
        }
        res.writeHead(301, {Location: '/customer/Course'});
        return res.end()
    }

    static async handleCourseToBuyPage(req, res) {
        let courseID = qs.parse(url.parse(req.url).query).id;
        if (req.method === 'GET') {
            await CustomerPageController.getCourseToBuyPage(req, res, courseID);
        } else {
            await CustomerPageController.buyCourse(req, res, courseID);
        }
    }

}

module.exports = CustomerPageController;