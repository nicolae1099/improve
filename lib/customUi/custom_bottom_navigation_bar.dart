import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:improve/model/navigation_bar_item_model.dart';
import 'package:improve/screens/home_screen.dart';
import '../screens/add_page.dart';
import '../dataManagement/data.dart';

class CustomBottomNavigation extends StatefulWidget {
  final List<NavigationBarItemModel> barItems;
  final Data data;
  final Function() refresh;
  const CustomBottomNavigation(
      {Key? key,
      required this.barItems,
      required this.data,
      required this.refresh})
      : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: widget.barItems
          .map((e) =>
              BottomNavigationBarItem(icon: Icon(e.iconType), label: e.label))
          .toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddPage(data: widget.data, refresh: widget.refresh)));
      }
    });
  }
}
