import 'package:flutter/material.dart';
import 'package:cp_app/constants.dart';
class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColor,
      padding: EdgeInsets.all(25.0),
      child: Text("Contact", style: TextStyle(fontSize: 36.0, color: Colors.white)),
    );
  }
}