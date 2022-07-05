import 'package:my_app/screens/app_index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const AppIndexScreen();
  },
);
