import 'package:my_app/screens/app_index.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/consultations_screen.dart';
import './route_handlers.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = rootHandler;
    router.define(AppIndexScreen.routeName, handler: rootHandler);
    router.define(
      ConsultationsScreen.routeName,
      handler: Handler(
          handlerFunc:
              (BuildContext? context, Map<String, List<String>> parameters) =>
                  const ConsultationsScreen()),
    );
  }
}
