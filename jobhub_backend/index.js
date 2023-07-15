const express = require('express')
const app = express()
const mongoose=require("mongoose");

const dotenv=require("dotenv");
const authRoute=require("./routes/auth");
const userRoute=require("./routes/user");
dotenv.config();
//process.env.VARIABLE_NAME
mongoose.connect(process.env.MONGO_URL).then(()=>console.log("db connected")).catch((err)=>{console.log(err)});

app.use(express.json());
app.use("/api/auth",authRoute);
app.use("/api/users",userRoute);

app.listen(process.env.PORT||5002, () => console.log(`Example app listening on port ${process.env.PORT}!`))