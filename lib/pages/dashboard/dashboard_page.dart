import 'package:flutter/material.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/dashboard/components/best_seller.dart';

import 'package:flutter_ui_responsive_admin_panel/pages/dashboard/components/navbar.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/dashboard/components/orders_indicator.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/dashboard/components/orders_revenue.dart';
import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Navbar(),
            SizedBox(
              height: defaultPadding,
            ),
            OrdersIndicator(),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BestSellers(),
                SizedBox(
                  width: defaultPadding,
                ),
                OrdersRevenue(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
