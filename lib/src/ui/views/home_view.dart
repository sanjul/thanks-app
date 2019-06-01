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
        },
        child: HomeView());
  }
}

class HomeViewState extends State<HomeView> {
  HomeState _homeState;
  double _imageHeight = 256.0;

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
      return new Scaffold(
        body: new Stack(
          children: <Widget>[
            _buildIamge(),
          _buildProfileRow()],
        ),
      );
    } else {
      return showProgress();
    }
  }

  Widget _buildIamge() {
    return new ClipPath(
      clipper: new DialogonalClipper(),
      child: new Image.asset('assets/images/cover.jpg',
          fit: BoxFit.fitHeight,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(120, 20, 10, 40)),
    );
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

  Widget _buildProfileRow() {
    return new Padding(
      padding: new EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
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
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  'Product designer',
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height - 60.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
