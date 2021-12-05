import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:improve/customData/navigation_bar.dart';
import 'package:improve/customUi/custom_bottom_navigation_bar.dart';
import 'package:improve/customUi/reusable_list_item.dart';
import 'package:improve/screens/add_page.dart';
import '../constants/colors.dart' as color;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [];

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
                  return ReusableListItem(
                      Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      items[index]);
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        barItems: NavigationBarConstants.barItems,
      ),
    );
  }
}
