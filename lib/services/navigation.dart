import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _service = NavigationService._internal();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory NavigationService() {
    return _service;
  }

  NavigationService._internal();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }
}
