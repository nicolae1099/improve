import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:improve/customUi/reusable_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [];

  Future<String> createAlertDialog(BuildContext context) async {
    TextEditingController customController = TextEditingController();
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Name of the Habit"),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop(customController.text
                        .toString()); // to go back to screen after submitting
                  })
            ],
          );
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
                  return ReusableListItem(
                      const Color(0xFFd2fddf), items[index]);
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context).then((onValue) {
            setState(() {
              if (onValue.isNotEmpty) {
                items.add(onValue);
              }
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
