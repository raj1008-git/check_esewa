import 'package:autumn/provider/book_mark_provider.dart';
import 'package:autumn/screens/home_page.dart';
import 'package:autumn/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyNewsApp());

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MainPage(),
        home: MainPage(),
      ),
    );
  }
}
