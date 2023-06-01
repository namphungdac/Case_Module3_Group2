const http = require('http');
const url = require('url');
const fs = require("fs");
let generalPageController = require('./src/controllers/GeneralPage.controller');
let adminPageController = require('./src/controllers/AdminPage.controller');
let customerPageController = require('./src/controllers/CustomerPage.controller');


const Server = http.createServer((req, res) => {
    let mimeTypes={
        'jpg' : 'images/jpg',
        'png' : 'images/png',
        'js' :'text/javascript',
        'css' : 'text/css',
        'svg':'image/svg+xml',
        'ttf':'font/ttf',
        'woff':'font/woff',
        'woff2':'font/woff2',
        'eot':'application/vnd.ms-fontobject'
    }
    let urlPath = url.parse(req.url).pathname;
    const filesDefences = urlPath.match(/\.js|\.css|\.png|\.svg|\.jpg|\.ttf|\.woff|\.woff2|\.eot/);
    if (filesDefences) {
        const extension = mimeTypes[filesDefences[0].toString().split('.')[1]];
        res.writeHead(200, {'Content-Type': extension});
        fs.createReadStream(__dirname  + req.url).pipe(res)
    } else {
        let chooseRouter;
        chooseRouter = ((typeof router[urlPath]) !== "undefined") ? router[urlPath] : generalPageController.getNotFoundPage;
        chooseRouter(req, res).catch(err => console.log(err.message));
    }
});

Server.listen(2000, 'localhost', () => {
    console.log('Server is running at http://localhost:2000');
});

let router = {
    '/': generalPageController.getPage,
    '/login': generalPageController.handleLoginPage,
    '/register': generalPageController.handleRegisterPage,
    '/customerHome': customerPageController.getCustomerHomePage,
    '/customerCourse': customerPageController.getCustomerCoursePage,

    '/adminHome': adminPageController.getAdminHomePage,
    '/adminCourse': adminPageController.getAdminCoursePage,
    '/adminAddCourse': adminPageController.getAdminAddCoursePage,
}

