import 'package:flutter/material.dart';
import 'package:thanksapp/User.dart';
import 'dart:convert';
import '../../../API.dart';
import 'UserDetailScreen.dart';

class UserList extends StatefulWidget {
  UserList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UserListState createState() => new _UserListState();
}

class _UserListState extends State<UserList> {
  var users = new List<User>();
  var usersCopy = new List<User>();
  TextEditingController editingController = TextEditingController();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        usersCopy.addAll(users);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  void filterSearchResults(String query) {
    var filteredUsers = new List<User>();
    if (query.isNotEmpty) {
      usersCopy.forEach((item) {
        if (item.name.toLowerCase().contains(query)) {
          filteredUsers.add(item);
        }
      });
      setState(() {
        users.clear();
        users.addAll(filteredUsers);
      });
      return;
    } else {
      setState(() {
        users.clear();
        users.addAll(usersCopy);
      });
    }
  }

  void onClickUser(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserDetail(user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value.toLowerCase());
              },
              controller: editingController,
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text(users[index].name),
                  ),
                  onTap: () {
                    onClickUser(users[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
