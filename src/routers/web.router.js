const generalPageController = require("../controllers/GeneralPage.controller");
const customerPageController = require("../controllers/CustomerPage.controller");
const adminPageController = require("../controllers/AdminPage.controller");
let router = {
    '/': generalPageController.getPage,
    '/about': generalPageController.getAboutPage,
    '/contact': generalPageController.getContactPage,
    '/login': generalPageController.handleLoginPage,
    '/register': generalPageController.handleRegisterPage,
    '/customer/Home': customerPageController.getCustomerHomePage,
    '/customer/Course': customerPageController.getCustomerCoursePage,
    '/customer/About': customerPageController.getAboutHomePage,
    '/customer/Contact': customerPageController.getContactHomePage,

    '/admin/Home': adminPageController.getAdminHomePage,
    '/admin/Course': adminPageController.handleAdminCoursePage,
    '/admin/Course/Add': adminPageController.handleAdminAddCoursePage,
    '/admin/Course/Edit': adminPageController.handleAdminEditCoursePage,
}

module.exports = router;