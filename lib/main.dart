import 'package:autumn/screens/home_page.dart';
import 'package:autumn/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyNewsApp());

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      home: MainPage(),
    );
  }
}
