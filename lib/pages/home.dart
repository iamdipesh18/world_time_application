import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
    final Color overlayColor = isDayTime ? Colors.blue.withOpacity(0.3) : Colors.black.withOpacity(0.4);

    if (data.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(color: overlayColor),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: Column(
                children: <Widget>[
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        elevation: 5,
                      ),
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
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
                      icon: const Icon(Icons.edit_location, color: Colors.white),
                      label: const Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text(
                    data['location'] ?? '',
                    style: const TextStyle(
                      fontSize: 36,
                      letterSpacing: 2,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['time'] ?? '',
                    style: const TextStyle(
                      fontSize: 72,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
