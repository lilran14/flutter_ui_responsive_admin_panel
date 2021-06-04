import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(),
          DrawerListMenu(
            icon: "icon_home.svg",
            title: "Home",
            onTap: () {},
            status: true,
          ),
          DrawerListMenu(
            icon: "icon_orders.svg",
            title: "Orders",
            onTap: () {},
            status: false,
          ),
          DrawerListMenu(
            icon: "icon_store.svg",
            title: "Store",
            onTap: () {},
            status: false,
          ),
          DrawerListMenu(
            icon: "icon_promotion.svg",
            title: "Promotions",
            onTap: () {},
            status: false,
          ),
          DrawerListMenu(
            icon: "icon_reports.svg",
            title: "Reports",
            onTap: () {},
            status: false,
          )
        ],
      ),
    );
  }
}

class DrawerListMenu extends StatelessWidget {
  const DrawerListMenu({
    Key? key,
    required this.status,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final bool status;
  final String title, icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        iconsUrl + icon,
        color: status == true ? Colors.white : kPrimaryDisable,
      ),
      title: Text(
        title,
        style: whiteTextStyle.copyWith(fontSize: 18),
      ),
      onTap: onTap,
      selected: status,
      selectedTileColor: kPrimaryActive,
      contentPadding: EdgeInsets.only(left: defaultPadding * 2),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 145,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: defaultPadding * 2,
            ),
            SvgPicture.asset(
              iconsUrl + "icon_logo.svg",
              width: 30,
            ),
            SizedBox(
              width: defaultGap,
            ),
            Text(
              "Bubble Shop",
              style: whiteTextStyle.copyWith(
                  fontSize: 24, fontWeight: FontWeight.w700),
            )
          ],
        ));
  }
}
