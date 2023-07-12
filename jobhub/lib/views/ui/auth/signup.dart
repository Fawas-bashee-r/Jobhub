import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/controllers/sign_up.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../controllers/login_provider.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/custom_btn.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(
        builder: (context, signUpNofier, child) => Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: CustomAppBar(
                    text: "Sign Up",
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
                        text: "Hello, Welcome!",
                        style:
                            appstyle(30, Color(kDark.value), FontWeight.w600)),
                    ReusableText(
                        text: "Fill the details to signup for an Account",
                        style: appstyle(
                            16, Color(kDarkGrey.value), FontWeight.w600)),
                    const HeightSpacer(size: 50),
                    CustomTextField(
                      controller: name,
                      keyBoardType: TextInputType.text,
                      hintText: "Full Name",
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 20),
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
                      obscureText: signUpNofier.obscureText,
                      validator: (password) {
                        if (signUpNofier.passwordValidator(password ?? "")) {
                          return "It must contain one uppercase,one lowercase,one special character,one digit,and more than 8 characters";
                        }
                        return null;
                      },
                      suffixIcon: GestureDetector(
                          onTap: () {
                            signUpNofier.obscureText =
                                !signUpNofier.obscureText;
                          },
                          child: Icon(
                            signUpNofier.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(kDark.value),
                          )),
                    ),
                    HeightSpacer(size: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginPage());
                        },
                        child: ReusableText(
                            text: "Login",
                            style: appstyle(
                                14, Color(kDark.value), FontWeight.w500)),
                      ),
                    ),
                    HeightSpacer(size: 50),
                    CustomButton(
                      onTap: () {},
                      text: "Sign Up",
                    )
                  ],
                ),
              ),
            ));
  }
}
