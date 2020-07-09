
import 'package:flutter/material.dart';
import 'package:cp_app/pages/root_page.dart';
import 'package:cp_app/services/authentication.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
