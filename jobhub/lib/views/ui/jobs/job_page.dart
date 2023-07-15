import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/custom_outline_btn.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/reusable_text.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key, required this.title, required this.id});
  final String title;
  final String id;

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.w),
        child: CustomAppBar(
            text: widget.title,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Entypo.bookmark),
              )
            ],
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(CupertinoIcons.arrow_left),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                HeightSpacer(size: 30),
                Container(
                  decoration: BoxDecoration(
                      color: Color(kLightGrey.value),
                      borderRadius: BorderRadius.circular(15)),
                  width: width,
                  height: hieght * 0.27,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      HeightSpacer(size: 10),
                      ReusableText(
                          text: "Flutter Develepor",
                          style: appstyle(
                              22, Color(kDark.value), FontWeight.w600)),
                      const HeightSpacer(size: 5),
                      ReusableText(
                          text: "Banglore",
                          style: appstyle(
                              16, Color(kDarkGrey.value), FontWeight.w600)),
                      HeightSpacer(size: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                              height: hieght * 0.04,
                              width: width * 0.26,
                              color2: Color(kLight.value),
                              text: "Full-Time",
                              color: Color(kOrange.value),
                            ),
                            Row(
                              children: [
                                ReusableText(
                                    text: "10k",
                                    style: appstyle(22, Color(kDark.value),
                                        FontWeight.w600)),
                                SizedBox(
                                  width: width * 0.2,
                                  child: ReusableText(
                                      text: "/monthly",
                                      style: appstyle(
                                          22,
                                          Color(kDarkGrey.value),
                                          FontWeight.w600)),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                HeightSpacer(size: 10),
                ReusableText(
                    text: "Job Description",
                    style: appstyle(22, Color(kDark.value), FontWeight.w600)),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style:
                      appstyle(16, Color(kDarkGrey.value), FontWeight.normal),
                ),
                const HeightSpacer(size: 25),
                ReusableText(
                    text: "Requirements",
                    style: appstyle(22, Color(kDark.value), FontWeight.w600)),
                const HeightSpacer(size: 6),
                SizedBox(
                    height: hieght * 0.6,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: requirements.length,
                      itemBuilder: (context, index) {
                        final req = requirements[index];
                        String bullet = "\u2022";
                        return Text(
                          "$bullet $req\n",
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                          style: appstyle(
                              16, Color(kDarkGrey.value), FontWeight.normal),
                        );
                      },
                    )),
                HeightSpacer(size: 20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomOutlineBtn(
                  onTap: () {},
                  color2: Color(kOrange.value),
                  text: "Apply Now",
                  color: Color(kLight.value),
                  width: width,
                  height: hieght * 0.06,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
