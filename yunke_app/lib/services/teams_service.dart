import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class TeamsService extends ChangeNotifier {
  final String _baseUrl = 'yunke-app-default-rtdb.firebaseio.com';
  final List<Team> teams = [];
  final storage = const FlutterSecureStorage();
  bool isLoading = false;

  TeamsService() {
    loadTeams();
  }

  Future<List<Team>> loadTeams() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'teams.json', {
      // 'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get(url);

    final Map<String, dynamic> teamsMap = jsonDecode(resp.body);

    teamsMap.forEach((key, value) {
      final tempTeam = Team.fromMap(value);
      tempTeam.id = key;
      teams.add(tempTeam);
    });

    isLoading = false;
    notifyListeners();

    return teams;
  }
}
