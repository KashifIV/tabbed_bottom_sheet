library tabbed_bottom_sheet;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tabbed_bottom_sheet/TabData.dart';
import 'package:tabbed_bottom_sheet/dim_background.dart';
import 'package:tabbed_bottom_sheet/sheet.dart';
import 'package:tabbed_bottom_sheet/tabs.dart';



class TabbedBottomSheet extends StatefulWidget {
  @required
  final List<Widget> children;
  @required List<TabData> tabData; 
  @required 
  final int initialTabNumber; 
  TabbedBottomSheet({this.children, this.initialTabNumber, this.tabData});
  _TabbedBottomSheet createState() => _TabbedBottomSheet(); 

  static open({
      @required BuildContext context,
      @required List<Widget> children, 
      @required List<TabData> tabsData, 
      int initalTabNumber = 0
    }) {
      Navigator.push(context, PageRouteBuilder(
        pageBuilder: (_ , __, ___){
          return TabbedBottomSheet(
            children: children,
            initialTabNumber: initalTabNumber,
            tabData: tabsData,
          ); 
        }
      , opaque: false)); 
    } 
  
}
class _TabbedBottomSheet extends State<TabbedBottomSheet> with SingleTickerProviderStateMixin{
  int _tabNumber; 
  List<Tabs> tabs = []; 
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
  void createTabs(){
    int counter = -1; 
    if (tabs.length == 0) {
      tabs = widget.tabData.map((item){
        counter++; 
        return Tabs(
          index: counter,
          numberOfTabs: widget.tabData.length,
          onSelect: _onUpdateSheet,
          tabData: item,
        ); 
      }).toList(); 
    }
  }
  void dispose(){
    super.dispose(); 
    _animationController.dispose(); 
  }
  void _onUpdateSheet(int index){
    if (index >= widget.children.length && index >= 0){
      return; 
    }
    _tabNumber = index; 
  }
  @override
  Widget build(BuildContext context) {
    createTabs();
    return WillPopScope( 
      onWillPop: (){
        _animationController.reverse(); 
        return Future.delayed(Duration(milliseconds: 500), () => true); 
      },
      child:Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Stack( children: <Widget>[
            DimBackround(percentDim: 0.5,), 
            Positioned(
              left: 0, right: 0, bottom: 0,
              height: animation.value,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[]..addAll(tabs),), 
                  Sheet(child: widget.children[_tabNumber],)
                ],
              )
            )           
          ]
        )
    ))); 
  }
}