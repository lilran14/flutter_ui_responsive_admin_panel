import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;
  final Widget xtraLargeDesktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
    required this.xtraLargeDesktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 992 &&
      MediaQuery.of(context).size.width >= 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 1400 &&
      MediaQuery.of(context).size.width >= 992;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 1750 &&
      MediaQuery.of(context).size.width >= 1400;

  static bool isXtraLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1750;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1750) {
      return xtraLargeDesktop;
    } else if (_size.width >= 1400 && largeDesktop != null) {
      return largeDesktop!;
    } else if (_size.width >= 992 && desktop != null) {
      return desktop!;
    } else if (_size.width >= 768 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
