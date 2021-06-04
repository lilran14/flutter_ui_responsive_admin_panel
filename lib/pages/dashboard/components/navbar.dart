import 'package:flutter/material.dart';
import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: kPrimary),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dashboard",
              style: whiteTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
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
