import 'package:flutter/material.dart';
import 'package:fluttertube/modules/home_module.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTube',
      home: HomeModule(),
      debugShowCheckedModeBanner: false,
    );
  }
}
