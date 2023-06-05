const qs = require('qs');
const BaseFunctionController = require('./BaseFunction.controller');
const CourseModel = require('../models/Course.model');
const url = require("url");
const formidable = require("formidable");
const fs = require("fs");

class AdminPageController {
    static async getHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/admin/HomePage.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email)
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
            <img class="card-img-top" src="${course.imageCourseLink}" height="284px" width="160px" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/KH1">${course.titleCourse}</a></h5>
                <p class="card-text">${course.contentCourse}</p>
            </div>
            <a href="/admin/Course/Edit?id=${course.courseID}"><button type="button" class="btn btn-primary">Edit</button></a>
            <button type="submit" name="courseID" value="${course.courseID}" class="btn btn-danger" onclick="return confirm('Bạn chắc chắn muốn xoá khoá học này?')">Delete</button>
            </div></form>`;
        });
        let htmlAdminCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/CoursePage.html');
        htmlAdminCoursePage = htmlAdminCoursePage.replace('{Course}', courseHtml);
        htmlAdminCoursePage = htmlAdminCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlAdminCoursePage);
        res.end();
    }

    static async deleteCourse(req, res) {
        let data = '';
        req.on('data', chunk => {
            data += chunk;
        });

        req.on('end', async () => {
            try {
                let courseID = qs.parse(data).courseID;
                await CourseModel.deleteCourseByCourseID(+courseID);
                res.writeHead(301, {Location: '/admin/Course'});
                res.end();
            } catch (err) {
                console.log(err.message);
            }
        });
    }

    static async getEditCoursePage(req, res, courseID) {
        try {
            let courseInfoDatabase = await CourseModel.getCourseByCourseID(courseID);
            let {imageCourseLink, titleCourse, contentCourse, priceCourse, describeCourse, teacher, times} = courseInfoDatabase[0];
            let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
            let htmlAdminEditCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/EditCoursePage.html');
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{urlImg}', imageCourseLink);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{titleCourse}', titleCourse);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{contentCourse}', contentCourse);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{priceCourse}', priceCourse);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{describeCourse}', describeCourse);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{teacher}', teacher);
            htmlAdminEditCoursePage = htmlAdminEditCoursePage.replace('{times}', times);
            res.writeHead(200, {'Context-type': 'text/html'});
            res.write(htmlAdminEditCoursePage);
            res.end();
        } catch (err) {
            console.log(err.message)
        }
    }

    static async editCourse(req, res, courseID) {
        let data = '';
        req.on('data', chunk => {
            data += chunk;
        });
        req.on('end', async () => {
            try {
                let courseInfoAdded = qs.parse(data);
                let {imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse, teacher, times} = courseInfoAdded;
                if (!imageCourseLink) {
                    await CourseModel.getImageCourseLinkByCourseID(courseID).then(data => imageCourseLink = data[0].imageCourseLink);
                } else {
                    imageCourseLink = '/public/img/' + imageCourseLink;
                }
                await CourseModel.updateCourseByCourseID(imageCourseLink, titleCourse, contentCourse, describeCourse, +priceCourse, teacher, times,courseID);
                res.writeHead(301, {Location: '/admin/Course'});
                res.end();
            } catch (err) {
                console.log(err.message);
            }
        });
    }

    static async getAddCoursePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let htmlAdminAddCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/AddCoursePage.html');
        htmlAdminAddCoursePage = htmlAdminAddCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlAdminAddCoursePage);
        res.end();
    }

    static async addCourse(req, res) {
        const form = new formidable.IncomingForm();
        form.parse(req, async (err, fields, files) => {
            if (err) {
                res.writeHead(err.httpCode || 400, {'Content-Type': 'text/plain'});
                res.end(String(err));
                return;
            }
            const oldpath = files.filetoupload.filepath;
            const newpath = './public/img/' + files.filetoupload.originalFilename;
            fs.copyFile(oldpath, newpath, async function (err) {
                if (err) throw err;
                let {titleCourse, contentCourse, describeCourse, priceCourse, teacher, times} = fields;
                let imageCourseLink = '/public/img/' + files.filetoupload.originalFilename;
                await CourseModel.addCourse(imageCourseLink, titleCourse, contentCourse, describeCourse, +priceCourse,teacher, times);
                res.writeHead(301, {Location: '/admin/Course'});
                return res.end()
            });
        });
    }

    static async handleCoursePage(req, res) {
        if (req.method === 'GET') {
            await AdminPageController.getCoursePage(req, res);
        } else {
            await AdminPageController.deleteCourse(req, res);
        }
    }

    static async handleEditCoursePage(req, res) {
        let courseID = qs.parse(url.parse(req.url).query).id;
        if (req.method === 'GET') {
            await AdminPageController.getEditCoursePage(req, res, courseID);
        } else {
            await AdminPageController.editCourse(req, res, courseID);
        }
    }

    static async handleAddCoursePage(req, res) {
        if (req.method === 'GET') {
            await AdminPageController.getAddCoursePage(req, res);
        } else {
            await AdminPageController.addCourse(req, res);
        }
    }

}

module.exports = AdminPageController;