import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/reusable_text.dart';
import 'package:jobhub/views/common/width_spacer.dart';

import '../../common/app_bar.dart';
import '../../common/drawer/drawe_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            text: "Profile",
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: DrawerWidget(),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: hieght * 0.12,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "",
                          width: 80.w,
                          height: 100.h,
                        ),
                      ),
                      WidthSpacer(width: 20),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                          text: "Fawas Basheer",
                          style: appstyle(
                              26, Color(kDark.value), FontWeight.w600)),
                      Row(
                        children: [
                          Icon(
                            MaterialIcons.location_pin,
                            color: Color(kDarkGrey.value),
                          ),
                          WidthSpacer(width: 5),
                          ReusableText(
                              text: "Banglore",
                              style: appstyle(
                                  16, Color(kDarkGrey.value), FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Feather.edit,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color(kLightGrey.value)),
                  width: width,
                  height: hieght * .12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(kLight.value),
                        ),
                        margin: EdgeInsets.only(left: 12.w),
                        width: 60,
                        height: 70,
                        child: Icon(
                          FontAwesome5Regular.file_pdf,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                              text: "Resume from Jobhub",
                              style: appstyle(
                                  18, Color(kDark.value), FontWeight.w500)),
                          ReusableText(
                              text: "Jobhub Resume",
                              style: appstyle(
                                  16, Color(kDarkGrey.value), FontWeight.w500))
                        ],
                      ),
                      WidthSpacer(width: 1)
                    ],
                  ),
                ),
                Positioned(
                    top: 2.h,
                    right: 10.h,
                    child: GestureDetector(
                        onTap: () {},
                        child: ReusableText(
                            text: "Edit",
                            style: appstyle(
                                16, Color(kOrange.value), FontWeight.w500))))
              ],
            ),
            HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8),
              width: width,
              height: hieght * .06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(kLightGrey.value)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                    text: "Fawas@gmail.com",
                    style: appstyle(16, Color(kDark.value), FontWeight.w600)),
              ),
            ),
            HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8),
              width: width,
              height: hieght * .06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(kLightGrey.value)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/usa.svg",
                      width: 20,
                      height: 22,
                    ),
                    WidthSpacer(width: 15),
                    ReusableText(
                        text: "+91 987654321",
                        style:
                            appstyle(16, Color(kDark.value), FontWeight.w600)),
                  ],
                ),
              ),
            ),
            HeightSpacer(size: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(kLightGrey.value)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: ReusableText(
                        text: "Skills",
                        style:
                            appstyle(18, Color(kDark.value), FontWeight.w600)),
                  ),
                  SizedBox(
                    height: hieght * .5,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: skills.length,
                          itemBuilder: (context, index) {
                            final skill = skills[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: width,
                                height: hieght * .06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(kLight.value),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ReusableText(
                                      text: skill,
                                      style: appstyle(16, Color(kDark.value),
                                          FontWeight.normal)),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
