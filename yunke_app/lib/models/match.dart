import 'dart:convert';

class Match {
  bool next;
  String home;
  String? homeImage;
  String away;
  String? awayImage;
  String category;
  String date;
  String hour;
  String tournament;
  String? id;

  Match({
    required this.next,
    required this.home,
    this.homeImage,
    required this.away,
    this.awayImage,
    required this.category,
    required this.date,
    required this.hour,
    required this.tournament,
  });

  factory Match.fromJson(String str) => Match.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Match.fromMap(Map<String, dynamic> json) => Match(
        next: json["next"],
        home: json["home"],
        homeImage: json["homeImage"],
        away: json["away"],
        awayImage: json["awayImage"],
        category: json["category"],
        date: json["date"],
        hour: json["hour"],
        tournament: json["tournament"],
      );

  Map<String, dynamic> toMap() => {
        "next": next,
        "home": home,
        "homeImage": homeImage,
        "away": away,
        "awayImage": awayImage,
        "category": category,
        "date": date,
        "hour": hour,
        "tournament": tournament,
      };
}
