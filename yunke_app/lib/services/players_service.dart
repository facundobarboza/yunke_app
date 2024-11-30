import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class PlayersService extends ChangeNotifier {
  final String _baseUrl = 'yunke-app-default-rtdb.firebaseio.com';
  final List<Player> players = [];
  final storage = const FlutterSecureStorage();
  bool isLoading = false;

  PlayersService() {
    loadPlayers();
  }

  Future<List<Player>> loadPlayers() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'players.json', {
      // 'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get(url);

    final Map<String, dynamic> playersMap = jsonDecode(resp.body);

    playersMap.forEach((key, value) {
      final tempPlayer = Player.fromMap(value);
      tempPlayer.id = key;
      players.add(tempPlayer);
    });

    isLoading = false;
    notifyListeners();

    return players;
  }
}
