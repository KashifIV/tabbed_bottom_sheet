library tabbed_bottom_sheet;

import 'package:flutter/material.dart';
import 'package:tabbed_bottom_sheet/dim_background.dart';
import 'package:tabbed_bottom_sheet/sheet.dart';
import 'package:tabbed_bottom_sheet/tabs.dart';


class TabbedBottomSheet extends StatefulWidget {
  @required
  final List<Widget> children;
  @required List<String> tabNames; 
  @required 
  final int initialTabNumber; 
  TabbedBottomSheet({this.children, this.initialTabNumber, this.tabNames});
  _TabbedBottomSheet createState() => _TabbedBottomSheet(); 

  static open({
      @required BuildContext context,
      @required List<Widget> children, 
      @required List<String> tabNames, 
      int initalTabNumber = 0
    }) {
      Navigator.push(context, PageRouteBuilder(
        pageBuilder: (_ , __, ___){
          return TabbedBottomSheet(
            children: children,
            initialTabNumber: initalTabNumber,
            tabNames: tabNames,
          ); 
        }
      , opaque: false)); 
    } 
  
}
class _TabbedBottomSheet extends State<TabbedBottomSheet> with SingleTickerProviderStateMixin{
  int _tabNumber; 
  AnimationController _animationController; 
  Animation<double> animation; 
  void initState(){
    super.initState(); 
    _tabNumber = widget.initialTabNumber; 
    _animationController = AnimationController( duration: const Duration(milliseconds:500), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(
      CurvedAnimation(
        parent:_animationController, 
        curve: Curves.easeOutQuad))
      ..addListener((){
        setState((){

        }); 
      }); 
    _animationController.forward(); 
  }
  void dispose(){
    super.dispose(); 
    _animationController.dispose(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: GestureDetector(
          child:  Stack( children: <Widget>[
            DimBackround(percentDim: 0.5,), 
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: animation.value,
              child: Column(
                children: <Widget>[
                  Tabs(text:widget.tabNames[_tabNumber]), 
                  Sheet(child: widget.children[_tabNumber],)
                ],
              )
            )
            
          ]
        )
    ))); 
  }
}