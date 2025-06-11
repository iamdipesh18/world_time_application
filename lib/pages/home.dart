import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (data.isEmpty && route != null && route.settings.arguments is Map) {
      data = route.settings.arguments as Map;
    }

    final bool isDayTime = data['isDayTime'] ?? true;
    final String bgImage = isDayTime ? 'day.png' : 'night.png';
    final Color bgColor = isDayTime ? Colors.blue : Colors.indigo[700]!;

    if (data.isEmpty) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      '/location',
                    );
                    if (result != null && result is Map) {
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag'],
                        };
                      });
                    }
                  },
                  icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                  label: Text('Edit Location'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'] ?? '',
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'] ?? 'Loading...',
                  style: TextStyle(fontSize: 66, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
