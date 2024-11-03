import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class MatchsService extends ChangeNotifier {
  final String _baseUrl = 'yunke-app-default-rtdb.firebaseio.com';
  final List<Match> matchs = [];
  final storage = const FlutterSecureStorage();
  bool isLoading = false;

  MatchsService() {
    loadMatchs();
  }

  Future<List<Match>> loadMatchs() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'matchs.json', {
      // 'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get(url);

    final Map<String, dynamic> matchsMap = jsonDecode(resp.body);

    matchsMap.forEach((key, value) {
      final tempMatch = Match.fromMap(value);
      tempMatch.id = key;
      matchs.add(tempMatch);
    });

    isLoading = false;
    notifyListeners();

    return matchs;
  }
}
