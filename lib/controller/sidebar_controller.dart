import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
