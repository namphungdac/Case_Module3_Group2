const qs = require('qs');
const BaseFunctionController = require('./BaseFunction.controller');
const UserModel = require('../models/User.model');

class GeneralPageController {
    static async getPage(req, res) {
        let html = await BaseFunctionController.readFileHTML('./src/views/general/homePage.html');
        res.writeHead(200, {'Content-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async getNotFoundPage(req, res) {
        let html = await BaseFunctionController.readFileHTML('./src/views/general/notFoundPage.html');
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async handleLoginPage(req, res) {
        if (req.method === 'GET') {
            let html = await BaseFunctionController.readFileHTML('./src/views/general/loginPage.html');
            await BaseFunctionController.writeFileData('./session/user', "");
            res.writeHead(200, {'Context-type': 'text/html'});
            res.write(html);
            res.end();
        } else {
            let data = '';
            req.on('data', chunk => {
                data += chunk;
            });
            req.on('end', async () => {
                let userLoginInfo = qs.parse(data);
                let {email, password} = userLoginInfo;
                let databaseUser = await UserModel.getAllUser();
                let user = databaseUser.filter(user => user.userEmail === email && user.userPassword === password);
                if (user.length > 0) {
                    if (user[0].role === 'customer') {

                        await BaseFunctionController.writeFileData('./session/user', JSON.stringify(userLoginInfo));
                        res.writeHead(301, {"location": "/customer/Home"});
                        res.end();
                    } else {
                        await BaseFunctionController.writeFileData('./session/user', JSON.stringify(userLoginInfo));
                        res.writeHead(301, {"location": "/admin/Home"});
                        res.end();
                    }
                } else {
                    res.writeHead(301, {location: '/login'});
                    res.end();
                }
            });
        }
    }

    static async handleRegisterPage(req, res) {
        if (req.method === 'GET') {
            let html = await BaseFunctionController.readFileHTML('./src/views/general/registerPage.html');
            res.writeHead(200, {'Context-type': 'text/html'});
            res.write(html);
            res.end();
        } else {
            let data = '';

            req.on('data', chunk => {
                data += chunk;
            });

            req.on('end', async () => {
                let userLoginInfo = qs.parse(data);
                let {name, age, address, email, password} = userLoginInfo
                let role = 'customer'
                await UserModel.addUser(email, password, role);
                await UserModel.addCustomer(name, address, +age);
                await BaseFunctionController.writeFileData('./session/user', JSON.stringify(userLoginInfo));
                res.writeHead(301, {"location": "/customer/Home"});
                res.end();
            });
        }
    }

    static async getAboutPage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let htmlCustomerCoursePage = await BaseFunctionController.readFileHTML('./src/views/general/aboutPage.html');
        htmlCustomerCoursePage = htmlCustomerCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlCustomerCoursePage);
        res.end();
    }

    static async getContactPage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let htmlCustomerCoursePage = await BaseFunctionController.readFileHTML('./src/views/general/contactPage.html');
        htmlCustomerCoursePage = htmlCustomerCoursePage.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);

        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(htmlCustomerCoursePage);
        res.end();
    }

}

module.exports = GeneralPageController;