import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_app/config/application.dart';
import 'package:my_app/config/routes.dart';
import 'package:my_app/locator.dart';
import 'package:my_app/services/navigation.dart';

void main() {
  setupLocator();
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
          headline2: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            height: 1.4,
          ),
          headline3: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            height: 1.4,
          ),
          headline4: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            height: 1.4,
          ),
          headline5: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          headline6: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          bodyText1: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          bodyText2: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          button: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
      ),
      onGenerateRoute: Application.router.generator,
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}
