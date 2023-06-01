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

    static async getAdminCoursePage(req, res) {
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
            <a href="/edit"><button type="button" class="btn btn-primary">Edit</button></a>
            <button type="submit" class="btn btn-danger">Delete</button>
        </div></form>`;
        });
        let htmlAdminCoursePage = await BaseFunctionController.readFileHTML('./src/views/admin/adminCoursePage.html');
        htmlAdminCoursePage = htmlAdminCoursePage.replace('{Course}', courseHtml);
        htmlAdminCoursePage = htmlAdminCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlAdminCoursePage);
        res.end();
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
              try{
                  let courseInfoAdded = qs.parse(data);
                  let {imageCourseLink, titleCourse, contentCourse, describeCourse, priceCourse} = courseInfoAdded;
                  imageCourseLink = '/public/img/' + imageCourseLink;
                  await CourseModel.addCourse(imageCourseLink, titleCourse, contentCourse, describeCourse, +priceCourse);
                  res.writeHead(301,{Location :'/adminAddCourse'});
                  res.end();
              }
              catch (err) {
                  console.log(err.message)
              }
            });
        }

    }

}

module.exports = AdminPageController;