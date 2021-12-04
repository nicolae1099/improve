import 'package:flutter/material.dart';
import 'package:improve/model/navigation_bar_item_model.dart';

class NavigationBarConstants {
  static List<NavigationBarItemModel> barItems = [
    NavigationBarItemModel(
      iconType: Icons.home,
      label: "Home",
    ),
    NavigationBarItemModel(
      iconType: Icons.business,
      label: "Specific",
    ),
    NavigationBarItemModel(
      iconType: Icons.add,
      label: "Addd",
    ),
    NavigationBarItemModel(
      iconType: Icons.bubble_chart,
      label: "Random",
    ),
    NavigationBarItemModel(
      iconType: Icons.account_circle_rounded,
      label: "Profile",
    ),
  ];
}
