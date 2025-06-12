import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  final String location; // Location name for UI
  String time = 'Loading...'; // The time in that location
  final String flag; // Asset flag icon path
  final String url; // Timezone string (e.g., 'Europe/Berlin')
  bool? isDaytime; // true for day, false for night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    final apiUrl = Uri.parse(
      'https://timeapi.io/api/Time/current/zone?timeZone=$url',
    );

    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String dateTime = data['dateTime'];

        final DateTime localDateTime = DateTime.parse(dateTime);
        isDaytime = localDateTime.hour >= 6 && localDateTime.hour < 18;
        time = DateFormat.jm().format(localDateTime);
      } else {
        print('API Error: ${response.statusCode}');
        time = 'Failed to fetch time';
      }
    } catch (e) {
      print('Exception in getTime(): $e');
      time = 'Could not retrieve time';
    }
  }
}
