import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanksapp/src/model/auth.dart';
import 'package:thanksapp/src/state/AppState.dart';
import 'package:thanksapp/src/ui/the_app.dart';

Future main() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  Auth auth= Auth();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppState>.value(notifier: AppState(prefs, auth),),
    ],
    child: TheApp(),
  ));
}
