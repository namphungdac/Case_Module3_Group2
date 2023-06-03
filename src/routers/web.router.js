const generalPageController = require("../controllers/GeneralPage.controller");
const customerPageController = require("../controllers/CustomerPage.controller");
const adminPageController = require("../controllers/AdminPage.controller");
let router = {
    '/': generalPageController.getPage,
    '/about': generalPageController.getAboutPage,
    '/contact': generalPageController.getContactPage,
    '/login': generalPageController.handleLoginPage,
    '/register': generalPageController.handleRegisterPage,

    '/customer/Home': customerPageController.getHomePage,
    '/customer/Course': customerPageController.getCoursePage,
    '/customer/About': customerPageController.getAboutPage,
    '/customer/Contact': customerPageController.getContactPage,
    '/customer/buy/course': customerPageController.handleCourseToBuyPage,

    '/admin/Home': adminPageController.getHomePage,
    '/admin/Course': adminPageController.handleCoursePage,
    '/admin/Course/Add': adminPageController.handleAddCoursePage,
    '/admin/Course/Edit': adminPageController.handleEditCoursePage,
}

module.exports = router;