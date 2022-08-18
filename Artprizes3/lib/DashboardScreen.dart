import 'package:artprizes3/DatabaseHelper.dart';
import 'package:artprizes3/Device.dart';
import 'package:artprizes3/EventHandler.dart';
import 'package:artprizes3/UserEventHelper.dart';
import 'package:flutter/material.dart';


int tabIndex = 0;

class DashboardScreen extends StatefulWidget {
  UserEventHelper _eventHelper;
  var _journalLists;
  var _setIndex;

  DashboardScreen(UserEventHelper eventHelper, setIndex) {
    _eventHelper = eventHelper;
    _setIndex = setIndex;
  }

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver {
  DatabaseHelper databaseHelper = DatabaseHelper();
  EventHandler eventHandler;
  var setIndex;

  @override
  void initState() {
    super.initState();
    super.setState(() {});
    setState(() {});
    WidgetsBinding.instance.addObserver(this);

  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    if (AppLifecycleState.resumed == state) {
      print("Dashbboard showing");
      new Device();
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
  }
}
