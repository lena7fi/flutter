import 'package:artprizes3/DashboardScreen.dart';
import 'package:artprizes3/DatabaseHelper.dart';
import 'package:artprizes3/Device.dart';
import 'package:artprizes3/EventHandler.dart';
import 'package:artprizes3/UserEventHelper.dart';
import 'package:flutter/material.dart';
import './ProjectEnv.dart';



class Dashboard extends StatefulWidget {
  UserEventHelper _eventHelper;

  Dashboard(UserEventHelper eventHelper) {
    _eventHelper = eventHelper;
  }

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  EventHandler eventHandler;
  int _currentIndex = 0;
  
  void setIndex(index) {
  setState((){
    _currentIndex = index; 
  });
}

  @override
  
  void initState() {
    new Device();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
    DashboardScreen(widget._eventHelper, setIndex),

  ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(ProjectEnv.projectColor),
          onTap: (int index) async {

            setState(() {
              _currentIndex = index;
            });
          }, // new
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard, color: Colors.white),
              title: new Text(
                'Dashboard',
                style: TextStyle(color: Colors.white),
              ),
            ),
        
   
            BottomNavigationBarItem(
              icon: new Icon(Icons.more_vert, color: Colors.white),
              title: new Text(
                'More',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        
        key: _scaffoldKey,
        body: Center(
          child: _pageOptions[_currentIndex],
        ),
        
      ),
    );
  }
}

