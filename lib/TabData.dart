import 'package:flutter/material.dart';

class TabData{
  final Text text; 
  final Icon icon; 
  final Image image; 
  final Color backgroundColor; 
  TabData({this.text, this.icon, this.image, this.backgroundColor})
  : assert(!(icon != null && image != null));//either icon or image or neither can be null

  Widget graphic(){
    if (icon != null){
      return icon; 
    }
    else if (image != null){
      return image; 
    }
    else return null; 
  }
}