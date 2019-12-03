import 'package:flutter/material.dart';
import 'package:tabbed_bottom_sheet/TabData.dart';


class Tabs extends StatelessWidget{
  @required final int index; 
  @required final int numberOfTabs; 
  @required final Function(int) onSelect; 
  final TabData tabData; 
  final bool selected; 
  Tabs({this.index, this.numberOfTabs, this.onSelect, this.tabData, this.selected}); 


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(index), 
     child: Container(
      width: MediaQuery.of(context).size.width/this.numberOfTabs,
      height: 40,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            this.tabData.graphic(), 
            SizedBox(width: 20,), 
            this.tabData.text, 
          ],
        ),
      ), 
      decoration: (tabData.decoration == null) ? BoxDecoration(
        color:(this.selected)? this.tabData.activeColor: this.tabData.backgroundColor, 
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10), 
          topRight: const Radius.circular(10), 
        ),
        border: (!this.selected) ? null :  Border.all(color: Colors.black)
      ): tabData.decoration.copyWith(color: (!this.selected) ? null: tabData.activeColor),
    )); 
  } 
}