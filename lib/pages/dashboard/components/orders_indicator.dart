import 'package:flutter/material.dart';
import 'package:flutter_ui_responsive_admin_panel/responsive.dart';
import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';
import 'package:intl/intl.dart';

class OrdersIndicator extends StatelessWidget {
  const OrdersIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultPadding),
      child: GridView.count(
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: Responsive.isMobile(context) ||
                Responsive.isTablet(context) ||
                Responsive.isDesktop(context)
            ? defaultPadding
            : 0,
        childAspectRatio: Responsive.isMobile(context)
            ? 1.3
            : Responsive.isTablet(context)
                ? 2.1
                : Responsive.isDesktop(context)
                    ? 2.58
                    : Responsive.isLargeDesktop(context)
                        ? 1.56
                        : 2,
        shrinkWrap: true,
        crossAxisCount: Responsive.isMobile(context) ||
                Responsive.isTablet(context) ||
                Responsive.isDesktop(context)
            ? 2
            : 4,
        children: [
          OrderIndicator(
            activeTitle: true,
            title: "Today",
            profit: 1234.5,
            orders: 50,
          ),
          OrderIndicator(
            activeTitle: false,
            title: "Yesterday",
            profit: 1534.5,
            orders: 80,
          ),
          OrderIndicator(
            activeTitle: false,
            title: "This Month",
            profit: 8234.5,
            orders: 1050,
          ),
          OrderIndicator(
            activeTitle: false,
            title: "All Time",
            profit: 122234.5,
            orders: 2080,
          )
        ],
      ),
    );
  }
}

class OrderIndicator extends StatelessWidget {
  const OrderIndicator({
    Key? key,
    required this.title,
    required this.orders,
    required this.profit,
    required this.activeTitle,
  }) : super(key: key);

  final String title;
  final bool activeTitle;
  final int orders;
  final double profit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding + defaultGap),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: kPrimary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: robotoStyle.copyWith(
                color: activeTitle == true ? kSematicGreen : kPrimaryDisable,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: defaultGap + 5,
          ),
          Text(
            NumberFormat.currency(symbol: "\$", decimalDigits: 1)
                .format(profit),
            style: whiteTextStyle.copyWith(
                fontSize: 36, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: defaultGap,
          ),
          Text(
            NumberFormat.decimalPattern().format(orders) + " orders",
            style: robotoStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
