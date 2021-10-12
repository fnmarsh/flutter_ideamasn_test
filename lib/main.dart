import 'package:flutter/material.dart';
import 'file:///C:/Users/USER/AndroidStudioProjects/flutter_transita_test/lib/screens/list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}


