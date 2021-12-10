import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:improve/screens/home_screen.dart';
import '../dataManagement/data.dart';

class AddPage extends StatefulWidget {
  final Data data;
  final Function() refresh;
  const AddPage({Key? key, required this.data, required this.refresh})
      : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final List users = <Item?>[
    const Item(
        'Red',
        Icon(
          Icons.circle,
          color: Colors.red,
        ),
        Colors.red),
    const Item(
        'Blue',
        Icon(
          Icons.circle,
          color: Colors.blue,
        ),
        Colors.blue),
    const Item(
        'Green',
        Icon(
          Icons.circle,
          color: Colors.green,
        ),
        Colors.green),
    const Item(
        'Orange',
        Icon(
          Icons.circle,
          color: Colors.orange,
        ),
        Colors.orange),
  ];

  Item? selectedUser;
  String taskname = "";

  @override
  void initState() {
    super.initState();
    selectedUser = users[2];
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Item>> items = users.map((user) {
      return DropdownMenuItem<Item>(
        value: user,
        child: Row(
          children: <Widget>[
            user.icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              user.name,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new habit'),
      ),
      body: Column(children: [
        TextFormField(
            onChanged: (text) {
              setState(() {
                taskname = text;
              });
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today, size: 40),
              hintText: 'Enter your task',
              labelText: 'Task Name',
            )),
        Row(children: [
          Expanded(child: Container()),
          DropdownButton<Item>(
            hint: Text("Select item"),
            value: selectedUser,
            onChanged: (value) {
              setState(() {
                selectedUser = value;
              });
            },
            items: items,
          ),
        ]),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.data.addTask(taskname, selectedUser!.color);
            widget.refresh();
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add)),
    );
  }
}

class Item {
  const Item(this.name, this.icon, this.color);
  final String name;
  final Icon icon;
  final Color color;
}
