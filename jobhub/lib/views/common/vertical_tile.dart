import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Color(kLightGrey.value),
              borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          height: hieght * 0.15,
          width: width,
          child: Column(children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(kLightGrey.value),
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/slack.png"),
                ),
                WidthSpacer(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: "Company name",
                        style:
                            appstyle(20, Color(kDark.value), FontWeight.w600)),
                    SizedBox(
                      width: width * 0.5,
                      child: ReusableText(
                          text: "Django Develepor",
                          style: appstyle(
                              18, Color(kDarkGrey.value), FontWeight.w600)),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(kLight.value),
                  child: Icon(Ionicons.chevron_forward),
                )
              ],
            ),
            const HeightSpacer(size: 10),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  ReusableText(
                      text: "20k",
                      style: appstyle(20, Color(kDark.value), FontWeight.w600)),
                  ReusableText(
                      text: "/monthly",
                      style:
                          appstyle(20, Color(kDarkGrey.value), FontWeight.w600))
                ],
              ),
            ),
          ])),
    );
  }
}
