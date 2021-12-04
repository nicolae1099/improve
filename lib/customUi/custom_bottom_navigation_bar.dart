import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  final Map<Icon, String> items;
  const CustomBottomNavigation({Key? key, required this.items})
      : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  List<Icon> addictionList = List<Icon>.from(
      widget.items.entries.map((MapEntry mapEntry) => mapEntry.value).toList());
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: widget.items.forEach((k,v) => {
        return BottomNavigationBarItem()
      });
        widget.items.map((key, value) => BottomNavigationBarItem(icon: null)),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
