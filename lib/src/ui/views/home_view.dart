import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanksapp/src/state/HomeState.dart';


class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();

  static ChangeNotifierProvider buildWithState() {
    return ChangeNotifierProvider<HomeState>(
      builder: (_) {
        HomeState state = HomeState();
        state.loadHome();
        return state;       
      } ,
      child: HomeView()
    );
  }
}

class HomeViewState extends State<HomeView> {
  HomeState _homeState;

  @override
  void setState(fn) {
    super.setState(fn);
    if (_homeState != null) {
      _homeState.loadHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    _homeState = Provider.of<HomeState>(context);

    if (_homeState.homeData != null) {
      return Scaffold(
        floatingActionButton: floatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: _homeState.homeData.isNotEmpty
            ? homeBody()
            : Container(),
      );
    } else {
      return showProgress();
    }

  }

  Widget homeBody() {
    List<Widget> _items = List<Widget>();
    //_items.add(somewidget);

    return Container(
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          // _getThankAnimation(),
          ListView(
            children: _items,
          ),
        ],
      ),
    );
  }


  Widget floatingButton() {
    
    return FloatingActionButton(
      onPressed: () {
       // do something
      },
      highlightElevation: 10,
      tooltip: 'Search',
      child: new Icon(Icons.search),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    );
  }

  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

 
}
