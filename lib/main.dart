import 'dart:io';

import 'package:flutter/material.dart';

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

  void checkconn() async
  {
    try{
      final result= await InternetAddress.lookup('google.com');
      if(result.isNotEmpty&& result[0].rawAddress.isNotEmpty)
        {
          print("connected");
        }
    }on SocketException catch (_){
        print("no connection");
    }
  }

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
             "Status",
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
                onPressed:checkconn,
              child: Text("Check"),
              color: Colors.red,
            )

          ],
        ),
      ),

    );
  }
}
