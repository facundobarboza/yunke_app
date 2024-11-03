import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class CalendarsService extends ChangeNotifier {
  final String _baseUrl = 'yunke-app-default-rtdb.firebaseio.com';
  final List<Calendar> calendars = [];
  final storage = const FlutterSecureStorage();
  bool isLoading = false;

  CalendarsService() {
    loadCalendars();
  }

  Future<List<Calendar>> loadCalendars() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'calendar.json', {
      // 'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get(url);

    final Map<String, dynamic> calendarsMap = jsonDecode(resp.body);

    calendarsMap.forEach((key, value) {
      final tempCalendar = Calendar.fromMap(value);
      tempCalendar.id = key;
      calendars.add(tempCalendar);
    });

    isLoading = false;
    notifyListeners();

    return calendars;
  }
}
