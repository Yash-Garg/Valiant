import 'package:flutter/material.dart';
import 'package:genpass/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GenPass',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
