import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:improve/customData/navigation_bar.dart';
import 'package:improve/customUi/custom_bottom_navigation_bar.dart';
import 'package:improve/customUi/reusable_list_item.dart';
import '../dataManagement/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.data}) : super(key: key);

  final Data data;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> items = [];

  @override
  void initState() {
    super.initState();
    items = widget.data.getTasks();
  }

  void updateState() {
    setState(() {
      items = widget.data.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracking app'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ReusableListItem(items[index].color,
                      items[index].color, items[index].name);
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        barItems: NavigationBarConstants.barItems,
        data: widget.data,
        refresh: updateState,
      ),
    );
  }
}
