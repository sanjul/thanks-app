import 'package:flutter/material.dart';
import 'package:thanksapp/User.dart';

class UserDetail extends StatelessWidget {
  UserDetail(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }
}

_body(BuildContext context) {
  return SafeArea(
    top: false,
    bottom: false,
    child: Container(
      child:Column(children: <Widget>[
        _buildProfileRow()
      ],) 

    ),
  );
}

Widget _buildProfileRow() {
    return new Padding(
      padding: new EdgeInsets.only(left: 16.0, top: 256 / 2.5),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            minRadius: 28.0,
            maxRadius: 28.0,
            child: Icon(Icons.perm_contact_calendar),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  'Ryan Barnes',
                  style: new TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  'Product designer',
                  style: new TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }