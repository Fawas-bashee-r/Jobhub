



const express = require("express");

const router = express.Router();
const userController = require("../controllers/userController");

const {verifyAndAuthorization,verifyToken}=require("../middleware/verifyToken");

router.put("/:id",verifyAndAuthorization
, userController.updateUser);


router.delete("/:id",verifyAndAuthorization
, userController.deleteUser);




module.exports = router;


