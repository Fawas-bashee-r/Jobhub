import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/width_spacer.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(kLightGrey.value),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.8,
          height: hieght * 0.20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Facebook.png"),
                  ),
                  WidthSpacer(width: 15),
                  ReusableText(
                      text: "FaceBook",
                      style: appstyle(24, Color(kDark.value), FontWeight.w600))
                ],
              ),
              HeightSpacer(size: 10),
              ReusableText(
                  text: "Senior Flutter Develepor",
                  style: appstyle(22, Color(kDark.value), FontWeight.w600)),
              ReusableText(
                  text: "Kerala,India",
                  style: appstyle(16, Color(kDarkGrey.value), FontWeight.w600)),
              HeightSpacer(size: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ReusableText(
                          text: "15k",
                          style: appstyle(
                              20, Color(kDark.value), FontWeight.w600)),
                      ReusableText(
                          text: "/monthly",
                          style: appstyle(
                              20, Color(kDarkGrey.value), FontWeight.w600))
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(
                      kLight.value,
                    ),
                    child: Icon(Ionicons.chevron_forward),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
