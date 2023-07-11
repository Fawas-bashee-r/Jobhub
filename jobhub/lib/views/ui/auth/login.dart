import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            text: "Login",
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(CupertinoIcons.arrow_left),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            HeightSpacer(size: 10.w),
            ReusableText(
                text: "Welcome Back!",
                style: appstyle(30, Color(kDark.value), FontWeight.w600)),
            ReusableText(
                text: "Fill the details to login to your Account",
                style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
            const HeightSpacer(size: 50),
            CustomTextField(
              controller: email,
              keyBoardType: TextInputType.emailAddress,
              hintText: "Email",
              validator: (email) {
                if (email!.isEmpty || !email.contains("@")) {
                  return "Please enter a valid Email";
                } else {
                  return null;
                }
              },
            ),
            HeightSpacer(size: 20),
            CustomTextField(
              controller: password,
              keyBoardType: TextInputType.emailAddress,
              hintText: "Password",
              validator: (password) {
                if (password!.isEmpty || password.length < 7) {
                  return "Please enter a valid Password";
                } else {
                  return null;
                }
              },
              suffixIcon: GestureDetector(
                  child: Icon(
                Icons.visibility,
                color: Color(kDark.value),
              )),
            ),
            HeightSpacer(size: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: ReusableText(
                    text: "Register",
                    style: appstyle(14, Color(kDark.value), FontWeight.w500)),
              ),
            ),
            HeightSpacer(size: 50),
          ],
        ),
      ),
    );
  }
}
