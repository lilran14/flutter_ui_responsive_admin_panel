import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';

class OrdersRevenue extends StatelessWidget {
  const OrdersRevenue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultGap + 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: kPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSection(
            onTapMore: () {},
            title: "Current Revenue",
          ),
          SizedBox(
            height: defaultGap,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: defaultPadding,
            crossAxisCount: 3,
            childAspectRatio: 2.9,
            children: [
              RevenueIndicator(),
              OrderIndicator(),
              CustomerIndicator()
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Text(
            "Revenue Graph",
            style: whiteTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          RevenueChart()
        ],
      ),
    ));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.title,
    required this.onTapMore,
  }) : super(key: key);

  final String title;
  final VoidCallback onTapMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: whiteTextStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Spacer(),
        InkWell(
          onTap: onTapMore,
          child: Row(
            children: [
              Text(
                "More",
                style: whiteTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 5,
              ),
              SvgPicture.asset(iconsUrl + "icon_more.svg")
            ],
          ),
        )
      ],
    );
  }
}

class RevenueIndicator extends StatelessWidget {
  const RevenueIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Revenue',
          labelStyle: whiteTextStyle.copyWith(
              fontSize: 15, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 19,
              backgroundColor: kPrimaryDisable,
              child: SvgPicture.asset(iconsUrl + "icon_arrow_up.svg"),
            ),
            SizedBox(
              width: defaultGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NumberFormat.currency(symbol: "\$", decimalDigits: 1)
                      .format(1234.5),
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  '''+ \$123,5 (12%)''',
                  style: robotoStyle.copyWith(
                      color: kSematicGreen,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderIndicator extends StatelessWidget {
  const OrderIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Order',
          labelStyle: whiteTextStyle.copyWith(
              fontSize: 15, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 19,
              backgroundColor: kPrimaryDisable,
              child: SvgPicture.asset(iconsUrl + "icon_arrow_up.svg"),
            ),
            SizedBox(
              width: defaultGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "50",
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  '''+ 10 (5%)''',
                  style: robotoStyle.copyWith(
                      color: kSematicGreen,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomerIndicator extends StatelessWidget {
  const CustomerIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Customer',
          labelStyle: whiteTextStyle.copyWith(
              fontSize: 15, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 19,
              backgroundColor: kPrimaryDisable,
              child: SvgPicture.asset(iconsUrl + "icon_arrow_down.svg"),
            ),
            SizedBox(
              width: defaultGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "20",
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  '''-12 (5%)''',
                  style: robotoStyle.copyWith(
                      color: kSemanticRed,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RevenueChart extends StatefulWidget {
  @override
  _RevenueChartState createState() => _RevenueChartState();
}

class _RevenueChartState extends State<RevenueChart> {
  List<Color> chartStrokeColor = [kSemanticPurple];
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.275,
      child: LineChart(
        mainData(),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: kPrimaryDisable,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => TextStyle(
              color: kTextGrey, fontWeight: FontWeight.bold, fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1';
              case 2:
                return '5';
              case 3:
                return '10';
              case 4:
                return '15';
              case 5:
                return '20';
              case 6:
                return '25';

              case 7:
                return 'Today';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: kTextGrey,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '140K';
              case 2:
                return '180K';
              case 3:
                return '220K';
              case 4:
                return '260K';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0.2),
            FlSpot(1, 0.5),
            FlSpot(2, 1),
            FlSpot(3, 1.5),
            FlSpot(4, 2.7),
            FlSpot(5, 3.5),
            FlSpot(7, 3.7),
          ],
          colors: chartStrokeColor,
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }
}
