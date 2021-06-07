import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_responsive_admin_panel/controller/sidebar_controller.dart';
import 'package:flutter_ui_responsive_admin_panel/responsive.dart';
import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';
import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SidebarController sidebarController = Get.find();
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: kPrimary),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          children: [
            if (Responsive.isMobile(context) ||
                Responsive.isTablet(context) ||
                Responsive.isDesktop(context))
              InkWell(
                onTap: () {
                  if (sidebarController
                      .scaffoldKey.currentState!.isDrawerOpen) {
                    sidebarController.closeDrawer();
                  } else {
                    sidebarController.openDrawer();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(right: defaultGap),
                  child: SvgPicture.asset(
                    iconsUrl + "icon_menu.svg",
                    width: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            Text(
              "Dashboard",
              style: whiteTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                child: Image.asset(imagesUrl + "image_avatar.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
