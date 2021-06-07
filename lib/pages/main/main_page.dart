import 'package:flutter/material.dart';
import 'package:flutter_ui_responsive_admin_panel/controller/sidebar_controller.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/dashboard/dashboard_page.dart';
import 'package:flutter_ui_responsive_admin_panel/pages/main/components/sidebar.dart';
import 'package:flutter_ui_responsive_admin_panel/responsive.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SidebarController sidebarController = Get.put(SidebarController());
    return Scaffold(
      key: sidebarController.scaffoldKey,
      drawer: Sidebar(),
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
