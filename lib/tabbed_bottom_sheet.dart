library tabbed_bottom_sheet;

import 'package:flutter/material.dart';
import 'package:tabbed_bottom_sheet/dim_background.dart';


class TabbedBottomSheet extends StatefulWidget {
  @required
  final Widget child; 
  TabbedBottomSheet({this.child});
  _TabbedBottomSheet createState() => _TabbedBottomSheet(); 

  static open({
      @required BuildContext context,
      @required Widget child, 
    }) {
      Navigator.push(context, PageRouteBuilder(
        pageBuilder: (_ , __, ___){
          return TabbedBottomSheet(child: child,); 
        }
      , opaque: false)); 
    } 
  
}
class _TabbedBottomSheet extends State<TabbedBottomSheet>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack( children: <Widget>[
      DimBackround(percentDim: 0.5,), 
     // Container(color: Colors.red, width: 100,height: 100,)
    ],))); 
  }
}