import 'package:flutter/material.dart';

class Tabs extends StatelessWidget{
  final String text; 
  Tabs({this.text}); 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.lightBlue,
      child: Text(this.text),
    ); 
  } 
}