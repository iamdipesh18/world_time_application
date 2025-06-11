import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location; // Location name for UI
  String time = 'Loading...'; // The time in that location (default placeholder)
  String flag; // Asset flag icon path
  String url; // API endpoint (e.g., 'Berlin')

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final apiUrl = Uri.parse(
        'https://timeapi.io/api/Time/current/zone?timeZone=Europe/$url',
      );

      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String dateTime =
            data['dateTime']; // Example: "2025-06-11T07:20:28.844541"

        DateTime localDateTime = DateTime.parse(dateTime);
        DateTime utcNow = DateTime.now().toUtc();

        Duration diff = localDateTime.difference(utcNow);
        String offsetSign = diff.isNegative ? '-' : '+';
        int offsetHours = diff.inHours.abs();
        int offsetMinutes = diff.inMinutes.remainder(60).abs();

        String offset =
            '$offsetSign${offsetHours.toString().padLeft(2, '0')}:${offsetMinutes.toString().padLeft(2, '0')}';

        // Optional: You can format localDateTime if you want to show only time, etc.
        time = localDateTime.toString();
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
