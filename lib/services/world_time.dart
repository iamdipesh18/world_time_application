import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for UI
  String time = 'Loading...'; // The time in that location
  String flag; // Asset flag icon path
  String url; // Timezone string (e.g., 'Europe/Berlin')
  bool? isDaytime; // true for day, false for night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final apiUrl = Uri.parse(
        'https://timeapi.io/api/Time/current/zone?timeZone=$url',
      );

      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String dateTime = data['dateTime'];

        DateTime localDateTime = DateTime.parse(dateTime);

        isDaytime = localDateTime.hour > 6 && localDateTime.hour < 20;
        time = DateFormat.jm().format(localDateTime);
      } else {
        time = 'Time not available';
        print('API Error: ${response.statusCode}');
      }
    } catch (e) {
      time = 'Time not available';
      print('Exception caught: $e');
    }
  }
}
