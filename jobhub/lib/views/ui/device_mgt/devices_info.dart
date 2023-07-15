import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/ui/device_mgt/widgets/device_info.dart';
import 'package:jobhub/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

import '../../common/app_bar.dart';
import '../../common/drawer/drawe_widget.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardNotifier>(context);

    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            text: "Device Managment",
            child: Padding(
              padding: EdgeInsets.all(12.0.h),
              child: DrawerWidget(),
            ),
          )),
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpacer(size: 50),
                Text(
                  "You are Logged into your account on these devices",
                  style: appstyle(16, Color(kDark.value), FontWeight.normal),
                ),
                HeightSpacer(size: 50),
                DeviceInfo(
                    location: "Banglore",
                    device: "MacBook",
                    platform: "Safari",
                    date: loginDate,
                    ipAddress: "123.123.12"),
                HeightSpacer(size: 50),
                DeviceInfo(
                    location: "Kerala",
                    device: "Iphone 14",
                    platform: "Mobile App",
                    date: loginDate,
                    ipAddress: "123.123.12"),
              ],
            ),
          ),
          Consumer<LoginNotifier>(
            builder: (context, loginNotifier, child) {
              return Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: GestureDetector(
                    onTap: () {
                      zoomNotifier.currentIndex = 0;
                      onBoardNotifier.isLastPage = false;
                      Get.to(() => OnBoardingScreen());
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ReusableText(
                          text: "Sign Out of All devices",
                          style: appstyle(
                              18, Color(kOrange.value), FontWeight.w600)),
                    ),
                  ));
            },
          )
        ],
      )),
    );
  }
}
