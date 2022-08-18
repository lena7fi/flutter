import 'package:flutter_appauth/flutter_appauth.dart';


class Session {
  static var sessionId;
  static var sessionUser;
  static AuthorizationTokenResponse tokenResponse;
  static SessionState _sessionState;


  static void cleanSessionData() {
    sessionId = null;
    sessionUser = null;
    tokenResponse = null;

  }

  static get isLoggedIn {
    return (_sessionState == SessionState.LoggedIn);
  }

  static get isExpired {
    return (_sessionState == SessionState.Expired);
  }

  static get isLoggedOut {
    return (_sessionState == SessionState.LoggedOut);
  }

  static get sessionState {
    return _sessionState;
  }

  static set sessionState(SessionState value) {
    if (value != SessionState.LoggedIn) {
      cleanSessionData();
    }
    _sessionState = value;
  }
}

enum SessionState { LoggedIn, LoggedOut, Expired }
