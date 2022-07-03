import 'package:favourites_project/favscreen_page.dart';
import 'package:flutter/material.dart';

import 'homescreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenPage(),
    );
  }
}
