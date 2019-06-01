import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanksapp/User.dart';
import 'package:thanksapp/src/state/AppState.dart';
import 'package:thanksapp/src/ui/util/AppUtil.dart';

class UserDetail extends StatelessWidget {
  UserDetail(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context, user));
  }
}

_body(BuildContext context, user) {

  Widget _saveButton = new IconButton(
      onPressed: (){
        print("button clicked");
        appUtil.popPage(context);
      },
      icon: new Icon(Icons.done),
    );


  return SafeArea(
    top: false,
    bottom: false,
    child: Scaffold(
          appBar: AppBar(actions: <Widget>[
          _saveButton
          ],),
          body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildTopText(context),
          _buildProfileRow(user),
          _buildLovePlusser(context),
          _buildMessage()

        ],
      )),
    ),
  );
}
Widget _buildTopText(context) {
  return Text("Tap on the heart icon to express your gratitude");
}
Widget _buildLovePlusser(context) {
  AppState state = Provider.of<AppState>(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        state.getLkes(),
        style: new TextStyle(fontSize: 50.0, fontWeight: FontWeight.w500,),
      ),
      InkWell(
            onTap:(){
              state.incrementLikes();
            },
              child: Container(
            width: 100,
            height: 100,
            child: Image.asset('assets/icons/appIcon.png')),
      )
    ],
  );
}

Widget _buildMessage() {
  return Text("Thank them");
}

Widget _buildProfileRow(User user) {
  return new Padding(
    padding: new EdgeInsets.only(left: 16.0, top: 256 / 2.5),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                user.name,
                style:
                    new TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400),
              ),
              new Text(
                'Product designer',
                style:
                    new TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
