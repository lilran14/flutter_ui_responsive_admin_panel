import 'package:flutter/material.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/main/main_page.dart';
import 'package:flutter_ui_responsive_admin_panel/shared/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI - Responsive Admin Panel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: kSecondary, canvasColor: kPrimary),
      home: MainPage(),
    );
  }
}
