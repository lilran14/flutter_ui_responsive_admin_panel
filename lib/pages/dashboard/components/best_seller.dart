import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';
import 'package:intl/intl.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
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
        children: [
          Row(
            children: [
              Text(
                "Best Sellers",
                style: whiteTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
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
          ),
          BestSellersTable()
        ],
      ),
    ));
  }
}

class BestSellersTable extends StatelessWidget {
  const BestSellersTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.only(top: defaultGap),
        child: DataTable(
          headingTextStyle:
              greyTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          horizontalMargin: 0,
          dataRowHeight: 60 + 15,
          headingRowHeight: 30,
          dataTextStyle: whiteTextStyle.copyWith(fontSize: 14),
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'Product',
              ),
            ),
            DataColumn(
              label: Text(
                'Sold',
              ),
            ),
            DataColumn(
              label: Text(
                'Stock',
              ),
            ),
            DataColumn(
              label: Text(
                'Profit',
                textAlign: TextAlign.end,
              ),
            ),
          ],
          rows: <DataRow>[
            dataRowBestSeller(
                imageUrl: "product_01.png",
                product: "ADIDAS ULTRABOOST DNA X LEGO Plates",
                sold: 578,
                stock: 10,
                profit: 50000),
            dataRowBestSeller(
                imageUrl: "product_02.png",
                product: "ADIDAS ULTRABOOST Uncaged",
                sold: 578,
                stock: 10,
                profit: 50000),
            dataRowBestSeller(
                imageUrl: "product_03.png",
                product: "ADIDAS ULTRABOOST 19 Core Black Solar Orange Grey",
                sold: 578,
                stock: 10,
                profit: 50000),
            dataRowBestSeller(
                imageUrl: "product_04.png",
                product: "AIR 1 MID High-top trainers",
                sold: 578,
                stock: 10,
                profit: 50000),
            dataRowBestSeller(
                imageUrl: "product_05.png",
                product: "NIKE React Element 55 University Gold",
                sold: 578,
                stock: 10,
                profit: 50000),
            dataRowBestSeller(
                imageUrl: "product_06.png",
                product: "ADIDAS ULTRABOOST DNA X LEGO Plates",
                sold: 578,
                stock: 10,
                profit: 50000),
            dataRowBestSeller(
                imageUrl: "product_07.png",
                product: "ADIDAS ULTRABOOST Manchester United",
                sold: 578,
                stock: 10,
                profit: 50000),
          ],
        ),
      ),
    );
  }

  DataRow dataRowBestSeller(
      {required String imageUrl,
      required String product,
      required int sold,
      required int stock,
      required double profit}) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Row(
          children: [
            Image.asset(imagesUrl + imageUrl),
            SizedBox(
              width: defaultGap + 5,
            ),
            Expanded(
              child: Text(
                product,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            )
          ],
        )),
        DataCell(Text(sold.toString())),
        DataCell(Text(stock.toString())),
        DataCell(Text(NumberFormat.currency(symbol: "\$", decimalDigits: 2)
            .format(profit))),
      ],
    );
  }
}
