const qs = require('qs');
const BaseFunctionController = require('./BaseFunction.controller');
const CourseModel = require('../models/Course.model');
const UserModel = require('../models/User.model');
const url = require("url");

class AdminPageController {
    static async getAdminHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/admin/adminHomePage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email)
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async handleAdminCoursePage(req, res) {
        if (req.method === 'GET') {
            let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
            let courseInfoDatabase = await CourseModel.getAllCourse();
            let courseHtml = '';
            courseInfoDatabase.forEach(course => {
                courseHtml += `<form method="post"> <div class="card text-center">
            <img class="card-img-top" src="${course.imageCourseLink}" height="284px" width="160px" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/KH1">${course.titleCourse}</a></h5>
                <p class="card-text">${course.contentCourse}</p>
            </div>
            <a href="/adminEditCourse?id=${course.courseID}"><button type="button" class="btn btn-primary">Edit</button></a>
            <button type="submit" name="courseID" value="${course.courseID}" class="btn btn-danger">Delete</button>
            </div></form>`;
            });
            let htmlAdminCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/adminCoursePage.html');
            htmlAdminCoursePage = htmlAdminCoursePage.replace('{Course}', courseHtml);
            htmlAdminCoursePage = htmlAdminCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
            res.writeHead(200, {'Context-type': 'text/html'});
            res.write(htmlAdminCoursePage);
            res.end();
        } else {
            let data = '';
            req.on('data', chunk => {
                data += chunk;
            });

            req.on('end', async () => {
                try {
                    let courseID = qs.parse(data).courseID;
                    await CourseModel.deleteCourseByCourseID(+courseID);
                    res.writeHead(301, {Location: '/adminCourse'});
                    res.end();
                } catch (err) {
                    console.log(err.message);
                }
            });
        }
    }

    static async handleAdminEditCoursePage(req, res) {
        let courseID = qs.parse(url.parse(req.url).query).id;
        if (req.method === 'GET') {
            let courseInfoDatabase = await CourseModel.getCourseByCourseID(courseID);
            let {imageCourseLink, titleCourse, contentCourse, priceCourse, describeCourse} = courseInfoDatabase[0];
            let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
            let htmlAdminEditCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/adminEditCoursePage.html');
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{urlImg}', imageCourseLink);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{titleCourse}', titleCourse);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{contentCourse}', contentCourse);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{priceCourse}', priceCourse);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{describeCourse}', describeCourse);
            res.writeHead(200, {'Context-type': 'text/html'});
            res.write(htmlAdminEditCoursePage);
            res.end();
        } else {
            let data = '';
            req.on('data', chunk => {
                data += chunk;
            });
            req.on('end', async () => {
                try {
                    let courseInfoAdded = qs.parse(data);
                    let {imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse} = courseInfoAdded;
                    if (imageCourseLink === '') {
                        await CourseModel.getImageCourseLinkByCourseID(courseID).then(data => imageCourseLink = data[0].imageCourseLink);
                    } else {
                        imageCourseLink = '/public/img/' + imageCourseLink;
                    }
                    await CourseModel.updateCourseByCourseID(imageCourseLink, titleCourse, contentCourse, describeCourse, +priceCourse, courseID);
                    res.writeHead(301, {Location: '/adminCourse'});
                    res.end();
                } catch (err) {
                    console.log(err.message);
                }
            });
        }
    }

    static async handleAdminAddCoursePage(req, res) {
        if (req.method === 'GET') {
            let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
            let htmlAdminAddCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/adminAddCoursePage.html');
            htmlAdminAddCoursePage = htmlAdminAddCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
            res.writeHead(200, {'Context-type': 'text/html'});
            res.write(htmlAdminAddCoursePage);
            res.end();
        } else {
            let data = '';
            req.on('data', chunk => {
                data += chunk;
            });
            req.on('end', async () => {
                try {
                    let courseInfoAdded = qs.parse(data);
                    let {imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse} = courseInfoAdded;
                    imageCourseLink = '/public/img/' + imageCourseLink;
                    await CourseModel.addCourse(imageCourseLink, titleCourse, contentCourse, describeCourse, +priceCourse);
                    res.writeHead(301, {Location: '/adminAddCourse'});
                    res.end();
                } catch (err) {
                    console.log(err.message)
                }
            });
        }

    }

}

module.exports = AdminPageController;