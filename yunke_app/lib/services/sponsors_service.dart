import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class SponsorsService extends ChangeNotifier {
  final String _baseUrl = 'yunke-app-default-rtdb.firebaseio.com';
  final List<Sponsor> sponsors = [];
  final storage = const FlutterSecureStorage();
  bool isLoading = false;

  SponsorsService() {
    loadSponsors();
  }

  Future<List<Sponsor>> loadSponsors() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'sponsors.json', {
      // 'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get(url);

    final Map<String, dynamic> sponsorsMap = jsonDecode(resp.body);

    sponsorsMap.forEach((key, value) {
      final tempSponsor = Sponsor.fromMap(value);
      tempSponsor.id = key;
      sponsors.add(tempSponsor);
    });

    isLoading = false;
    notifyListeners();

    return sponsors;
  }
}
