import 'package:flutter/material.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/dashboard/dashboard_page.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/main/components/sidebar.dart';
import 'package:flutter_ui_responsive_admin_panel/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          if (Responsive.isXtraLargeDesktop(context) ||
              Responsive.isLargeDesktop(context))
            Expanded(
                child: Container(
              child: Sidebar(),
            )),
          Expanded(flex: 5, child: DashboardPage()),
        ],
      )),
    );
  }
}
