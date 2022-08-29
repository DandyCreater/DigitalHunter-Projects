import 'package:digital_hunter/presentation/mainpage.dart';
import 'package:digital_hunter/presentation/screen/homepage-screen/homepage_screen.dart';
import 'package:digital_hunter/presentation/screen/missionpage-screen/missionpage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String mainPageRoute = '/';
  static const String homePageRoute = '/homepage';
  static const String missionPageRoute = '/mission';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainPageRoute:
        return MaterialPageRoute(builder: ((context) => const MainPage()));
      case Routes.homePageRoute:
        return MaterialPageRoute(
            builder: ((context) => const HomePageScreen()));
      case Routes.missionPageRoute:
        return MaterialPageRoute(
            builder: ((context) => const MissionPageScreen()));
      default:
        return noRouteFound();
    }
  }

  static Route<dynamic> noRouteFound() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(
                child: Text("No Route Found"),
              ),
            ));
  }
}
