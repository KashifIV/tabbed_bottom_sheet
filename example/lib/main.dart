import 'package:flutter/material.dart';
import 'package:tabbed_bottom_sheet/tabbed_bottom_sheet.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button to open the Tabbed Bottom Sheet',
            ),
            FlatButton(
              child: Text(
                'Click Me!', 
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              color: Colors.blueAccent,
              onPressed:() =>  TabbedBottomSheet.open(context: context, children: <Widget>[Container(width: 200, color: Colors.red,)], tabNames: ['Hello, World!']),
            )
          ],
        ),
      ),
    );
  }
}
