import 'package:flutter/material.dart';
import 'package:thanksapp/src/ui/views/home_view.dart';
import 'package:thanksapp/src/ui/views/navigation/navigatable.dart';


class Config {
  /// Navigatables.
  /// This defines app navigation.
  /// It Used in conjunction with AppNavigatorView
  static List<Navigatable> get navigatables => [
        Navigatable(icon: Icons.home, title: "Home", tabs: [
          Navigatable(
            // title: "Home",
            icon: Icons.home,
            builder: () => HomeView.buildWithState() ,
          ),
          // Navigatable(
          //   // title: "Time Line",
          //   icon: Icons.view_list,
          //   builder: () => TimelineView.buildWithState(),
          // )
        ]),
      ];
}
