const qs = require('qs');
const BaseFunctionController = require('./BaseFunction.controller');
const UserModel = require('../models/User.model');

class GeneralPageController {
    static async getPage(req, res) {
        let html = await BaseFunctionController.readFileHTML('./src/views/general/page.html');
        res.writeHead(200, {'Content-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async getNotFoundPage(req, res) {
        let html = await BaseFunctionController.readFileHTML('./src/views/general/notfound.html');
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async handleLoginPage(req, res) {
        if (req.method === 'GET') {
            let html = await BaseFunctionController.readFileHTML('./src/views/general/login.html');
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
                        res.writeHead(301,{"location": "/customerHome"});
                        res.end();
                    } else {
                        res.writeHead(301,{"location": "/adminHome"});
                        res.end();
                    }
                }
                else {
                    res.writeHead(301, {location: '/login'});
                    res.end();
                }
            });
        }
    }

    static async handleRegisterPage(req, res) {
        if (req.method === 'GET') {
            let html = await BaseFunctionController.readFileHTML('./src/views/general/register.html');
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
                res.writeHead(301, {"location": "/customerHome"});
                res.end();
            });
        }
    }

    static async getCustomerHomePage(req, res) {
        let userLoginInfo = await BaseFunctionController.readFileHTML('./session/user');
        let html = await BaseFunctionController.readFileHTML('./src/views/general/customerHome.html');
        html = html.replace('{customerName}', JSON.parse(userLoginInfo.toString()).email);
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

    static async getAdminHomePage(req, res) {
        let html = await BaseFunctionController.readFileHTML('./src/views/general/adminHome.html');
        res.writeHead(200, {'Context-type': 'text/html'});
        res.write(html);
        res.end();
    }

}

module.exports = GeneralPageController;