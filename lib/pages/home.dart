import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //    print("ChooseLocation screen loaded!"); // Debug log
    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments is Map) {
      data = route.settings.arguments as Map;
    }
    ;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location'),
            ),
          ],
        ),
      ),
    );
  }
}
