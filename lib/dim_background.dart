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
    _alpha = IntTween(begin: 0, end: (255-(255*widget.percentDim).round())).animate(_controller)
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black.withAlpha(_alpha.value),
    );
  }
}