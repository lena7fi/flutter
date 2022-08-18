/*Event helper class any user event will first call method from this class*/

import './EventHandler.dart';

class UserEventHelper {
  EventHandler _eventHandler;

  UserEventHelper(EventHandler eventHandler){
      _eventHandler = eventHandler;
  }

  
 


  
  logout(){
    _eventHandler.logout();
  }
}
