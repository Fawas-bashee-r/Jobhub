



const express = require("express");
const router = express.Router();
const authController = require("../controllers/authContoller");

// REGISTRATION
router.post("/register", authController.createUser);

// LOGIN
router.post("/login", authController.loginUser);

module.exports = router;
