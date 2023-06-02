const generalPageController = require("../controllers/GeneralPage.controller");
const customerPageController = require("../controllers/CustomerPage.controller");
const adminPageController = require("../controllers/AdminPage.controller");
let router = {
    '/': generalPageController.getPage,
    '/about': generalPageController.getAboutPage,
    '/contact': generalPageController.getContactPage,
    '/login': generalPageController.handleLoginPage,
    '/register': generalPageController.handleRegisterPage,

    '/customerHome': customerPageController.getCustomerHomePage,
    '/customerCourse': customerPageController.getCustomerCoursePage,

    '/adminHome': adminPageController.getAdminHomePage,
    '/adminCourse': adminPageController.handleAdminCoursePage,
    '/adminAddCourse': adminPageController.handleAdminAddCoursePage,
    '/adminEditCourse': adminPageController.handleAdminEditCoursePage,
}

module.exports = router;