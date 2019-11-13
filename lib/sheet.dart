import 'package:flutter/material.dart';

class Sheet extends StatelessWidget{
  final Widget child; 
  Sheet({this.child}); 
  @override
  Widget build(BuildContext context) {
    return Flexible(child: Container(
      color: Colors.white,
      height: 600,
      width: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: child, 
      )
    ));
  }
}