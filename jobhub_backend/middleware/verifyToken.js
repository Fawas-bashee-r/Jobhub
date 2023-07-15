const User = require("../models/User");
const jwt = require("jsonwebtoken");

const verifyToken = (req, res, next) => {
  const authHeader = req.headers.token;
  if (authHeader) {
    const token = authHeader.split(" ")[1];

    try {
      const user = jwt.verify(token, process.env.JWT_SEC);
      req.user = user;
      console.log(user);
      next();
    } catch (err) {
      res.status(403).json("Invalid token");
    }
  } else {
    return res.status(401).json("You are not authenticated");
  }
};

const verifyAndAuthorization = (req, res, next) => {
  verifyToken(req, res, () => {
    if (req.user && req.user.id === req.params.id) {
      next();
    } else {
      res.status(403).json("You are restricted from performing this operation");
    }
  });
};

module.exports = { verifyToken, verifyAndAuthorization };
