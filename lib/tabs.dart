import 'package:flutter/material.dart';
import 'package:tabbed_bottom_sheet/TabData.dart';

class Tabs extends StatelessWidget{
  
  @required final int index; 
  @required final int numberOfTabs; 
  @required final Function(int) onSelect; 
  final TabData tabData; 
  Tabs({this.index, this.numberOfTabs, this.onSelect, this.tabData}); 
  void onDeselect(){
    
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect(this.index),
     child: Container(
      width: MediaQuery.of(context).size.width/this.numberOfTabs,
      height: 40,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            tabData.graphic(), 
            SizedBox(width: 20,), 
            tabData.text, 
          ],
        ),
      ), 
      decoration: BoxDecoration(
        color: tabData.backgroundColor, 
        border: Border.all(color: Colors.grey)
      ),
    )); 
  } 
}