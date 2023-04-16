import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qwique/screens/home_screen.dart';

class NavigatorItem {
  final String label;
  final IconData iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("", FontAwesomeIcons.homeAlt, 0, HomePage()),
  NavigatorItem("", FontAwesomeIcons.bookmark, 1, Container()),
  NavigatorItem("", Icons.notifications, 2, Container()),
  NavigatorItem("", FontAwesomeIcons.person, 3, Container()),
];
