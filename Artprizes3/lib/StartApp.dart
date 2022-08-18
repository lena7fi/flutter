import 'package:artprizes3/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'utils/Sync.dart';


var dbData;
var  dbData1;

class StartApp extends StatefulWidget {
  StartApp({Key key}) : super(key: key);

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  void initState() {
    
    print("Initialising StartApp initState before initState");
  
    super.initState();

  }

  

  @override
  Widget build(BuildContext context) {
    print("Initialising StartApp build");
    new Sync();
    return Scaffold(body: SplashScreen());
  }
}
