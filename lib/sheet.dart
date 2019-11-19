import 'package:flutter/material.dart';

class Sheet extends StatelessWidget{
  final Widget child; 
  final double height; 
  Sheet({this.child, this.height}); 
  @override
  Widget build(BuildContext context) {
    return  ClipRect( child:Container(
        color: Colors.white,
        height: this.height,
        width: MediaQuery.of(context).size.width,
        child:  this.child,
    ));
  }
}