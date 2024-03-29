import 'package:flutter/material.dart';
import 'package:thanksapp/src/ui/views/navigation/appdrawer_view.dart';
import 'navigatable.dart';

class AppNavigatorView extends StatefulWidget {
  final List<Navigatable> _navigatables;

  @override
  AppNavigatorViewState createState() => AppNavigatorViewState();

  AppNavigatorView(this._navigatables);
}

class AppNavigatorViewState extends State<AppNavigatorView> {
  List<Navigatable> _views;
  Navigatable _currentView;

  List<Navigatable> get views => _views;
  Navigatable get currentView => this._currentView;

  @override
  void initState() {
    /* List of views that can be loaded in home view */
    _views = widget._navigatables;

    /* Set Home view as the default view */
    _currentView = _views[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Scaffold(
      // appBar: new AppBar(
      //   // title: Text(_currentView != null ? _currentView.title : null),
      //   bottom: _buildTabs(),
      // ),
      body: _buildBody(),
      drawer: AppDrawer(this),
      bottomNavigationBar: Container(
        color: Colors.red,
        child:_buildTabs(),),
    );

    if (_currentView.builder == null &&
        _currentView.tabs != null &&
        _currentView.tabs.isNotEmpty) {
      content = DefaultTabController(
        length: _currentView.tabs.length,
        child: content,
      );
    }

    return content;
  }

  void navigateTo(Navigatable view) {
    setState(() {
      _currentView = view;
    });
  }

  Widget _buildBody() {
    if (_currentView.builder != null) {
      return _currentView.builder();
    } else if (_currentView.tabs != null && _currentView.tabs.isNotEmpty) {
      return TabBarView(
        children: _currentView.tabs
            .map(
              (nav) => nav.builder(),
            )
            .toList(),
      );
    } else {
      return Center(child: Text("Invalid view"));
    }
  }

  Widget _buildTabs() {
    if (_currentView.tabs != null && _currentView.builder == null) {
      List<Tab> _tabs = new List<Tab>();
      _currentView.tabs.forEach((nav) {
        _tabs.add(Tab(
          icon: nav.icon != null ? Icon(nav.icon) : null,
          text: nav.title,
        ));
      });
      return TabBar(
        tabs: _tabs,
      );
    }

    return null;
  }
}
