import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/constants/app_constants.dart';

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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: width,
            height: hieght * 0.12,
            color: Color(kLight.value),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: CachedNetworkImage(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
