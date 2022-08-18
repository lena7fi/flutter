import 'dart:async';
import 'package:artprizes3/Dashboard.dart';
import 'package:artprizes3/Login.dart';
import 'package:artprizes3/UserEventHelper.dart';
import 'package:flutter/material.dart';

import 'EventHandler.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State createState() => new AuthSession();
}


class AuthSession extends State<Home> with WidgetsBindingObserver {
  //We need to call this function as it initates the State
  EventHandler _eventHandler;
  Widget _currentView;
  Timer timer;
  @override
  void initState() {
    print("Initialising StartApp initState");

    WidgetsBinding.instance.addObserver(this);
    super.initState();
    
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
      print("Home showing");
    }
  }

  void setup() async {
    _eventHandler = new EventHandler(logout);
    //getBridgeData();
    setCurrentView(Dashboard(new UserEventHelper(_eventHandler)));
  }

  void logout() async {
    _eventHandler = null;
    setCurrentView(Login(login));
  }

  void login() async {
    // Session.sessionState = SessionState.LoggedIn;
    // setup();
       setup();

  }

  /*
   * Calling this function will re-render the widget, by calling build function with current state
  */
  void setCurrentView(Widget view) {
    setState(() {
      _currentView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentView,
    );
  }
}

