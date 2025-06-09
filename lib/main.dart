import 'package:flutter/material.dart';
import 'package:world_time_application/pages/home.dart';
import 'package:world_time_application/pages/choose_location.dart';
import 'package:world_time_application/pages/loading.dart';
import 'package:http/http.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ),
);
