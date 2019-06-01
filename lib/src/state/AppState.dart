import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanksapp/src/model/auth.dart';

class AppState with ChangeNotifier {

  Auth _auth;

  static const PREF_IS_DARK_MODE_ENABLED = "isDarkModeEnabled";
  SharedPreferences _prefs;
  
  AppState(SharedPreferences prefs, Auth auth)  {
    _prefs = prefs;
    _auth = auth;
  }

  bool _isDarkModeEnabled;

  void setDarkModeEnabled(bool isEnabled) {
    _isDarkModeEnabled = isEnabled;
    _prefs.setBool(PREF_IS_DARK_MODE_ENABLED, _isDarkModeEnabled);
    notifyListeners();
  }

  bool get isDarkModeEnabled {
    if(_isDarkModeEnabled == null){
      _isDarkModeEnabled = _prefs.getBool(PREF_IS_DARK_MODE_ENABLED) ?? false;
    }
    return _isDarkModeEnabled;
  }

  Auth get auth{
    return auth;
  }
}

