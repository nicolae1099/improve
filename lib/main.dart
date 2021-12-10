import 'package:flutter/material.dart';
import 'package:improve/screens/home_screen.dart';
import '../dataManagement/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Data data = Data();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Improve everyday', home: HomeScreen(data: data));
  }
}
