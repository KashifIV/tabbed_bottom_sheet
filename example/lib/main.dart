import 'package:flutter/material.dart';
import 'package:tabbed_bottom_sheet/TabData.dart';
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
              onPressed:() =>  TabbedBottomSheet.open(
                context: context, 
                children: <Widget>[
                  ListView(
                    children: <Widget>[]
                    ..add(DefaultCard(color: Colors.red,))
                    ..add(DefaultCard(color: Colors.blue,))
                    ..add(DefaultCard(color: Colors.green,)),
                  ),  
                  Container(width: 200, color: Colors.green, child: Text("weee"),)
                  ], 
                tabsData: [
                  TabData(
                    text: Text(
                      'Hello, World!', 
                      style: TextStyle(
                        color: Colors.white ,
                      ),
                    ), 
                    icon: Icon(Icons.work, color: Colors.white,),
                    backgroundColor: Colors.blueGrey
                  ),
                  TabData(
                    text: Text(
                      'Hello, Again!!', 
                      style: TextStyle(
                        color: Colors.white ,
                      ),
                    ), 
                    icon: Icon(Icons.work, color: Colors.white,),
                    backgroundColor: Colors.blueGrey
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}

class DefaultCard extends StatelessWidget{
  final Color color; 
  DefaultCard({this.color});

  Widget build(BuildContext context) {
    return Card(
      color: this.color, 
      elevation: 2.0,
      child: Container(height: 200, child: Center(child:Text('Card Item', style: TextStyle(color: Colors.white, fontSize: 20),))),
    );
  }
}