import 'package:flutter/material.dart';

class DimBackround extends StatefulWidget{
  final double percentDim; 
  DimBackround({this.percentDim}); 
  _DimBackground createState() => _DimBackground(); 
}
class _DimBackground extends State<DimBackround> with SingleTickerProviderStateMixin{
  AnimationController _controller; 
  Animation<int> _alpha; 
  void initState(){
    super.initState(); 
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);
    _alpha = IntTween(begin: 0, end: (255-(255*widget.percentDim).round())).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: Curves.decelerate))
      ..addListener((){
        setState(() {
          
        });
      }); 
    _controller.forward(); 
  }

  void dispose(){
    super.dispose(); 
    _controller.dispose(); 
  }

  @override
  Widget build(BuildContext context){ 
    return WillPopScope( 
      onWillPop: (){
        _controller.reverse(); 
        return Future.delayed(Duration(milliseconds: 500), () => true); 
      },
      child: GestureDetector(
        onTap: () => Navigator.maybePop(context),
        child:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withAlpha(_alpha.value),
    )));
  }
}