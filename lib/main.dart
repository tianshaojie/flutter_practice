import 'package:flutter/material.dart';
import 'package:flutter_practice/main/widgets/bottom_navigation_widget.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
      home: NavigationKeepAlive(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}