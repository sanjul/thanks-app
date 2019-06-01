import 'package:flutter/material.dart';

import 'User.dart';

class UserDetail extends StatelessWidget {
  UserDetail(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UserDetail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: new AppBar(
            title: new Text("User Detail"),
          ),
        body: Container(
          padding:  const EdgeInsets.all(8.0),
          child: Text(user.name),
        ),
      ),
    );
  }
}
