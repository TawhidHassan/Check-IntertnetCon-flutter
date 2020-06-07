import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

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

  StreamSubscription connectivitySubcription;
  ConnectivityResult oldresult;

  @override
  void initState(){
    super.initState();

    //continues look connection or not when app is running
    connectivitySubcription=Connectivity().onConnectivityChanged.listen((ConnectivityResult resnow){
      if(resnow==ConnectivityResult.none)
        {
          print("no connection");
        }
      else if (oldresult==ConnectivityResult.none){
        print(" connection");
      }
      oldresult=resnow;
    });
  }

  //when go to nest page not work conectivity function
  @override
  void dispose()
  {
    super.dispose();
    connectivitySubcription.cancel();
  }

  //coonectivity package
//  void checkconn() async{
//    var connectivityResult = await (Connectivity().checkConnectivity());
//    if(connectivityResult==ConnectivityResult.none)
//    {
//      print("no connection");
//    }
//    else if(connectivityResult==ConnectivityResult.wifi)
//    {
//      print("wifi");
//    }
//    else if(connectivityResult==ConnectivityResult.mobile)
//    {
//      print("mobile");
//    }
//  }

//  socked method
//  void checkconn() async
//  {
//    try{
//      final result= await InternetAddress.lookup('google.com');
//      if(result.isNotEmpty&& result[0].rawAddress.isNotEmpty)
//        {
//          print("connected");
//        }
//    }on SocketException catch (_){
//        print("no connection");
//    }
//  }

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
                onPressed:(){},
              child: Text("Check"),
              color: Colors.red,
            )

          ],
        ),
      ),

    );
  }
}
