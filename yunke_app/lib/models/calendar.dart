import 'dart:convert';

class Calendar {
  bool available;
  String day;
  String hour;
  String month;
  String homeTeamName;
  String? homeTeamImage;
  String awayTeamName;
  String? awayTeamImage;
  String category;
  String tournament;
  String? id;

  Calendar({
    required this.available,
    required this.day,
    required this.hour,
    required this.month,
    required this.homeTeamName,
    this.homeTeamImage,
    required this.awayTeamName,
    this.awayTeamImage,
    required this.category,
    required this.tournament,
  });

  factory Calendar.fromJson(String str) => Calendar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Calendar.fromMap(Map<String, dynamic> json) => Calendar(
        available: json["available"],
        day: json["day"],
        hour: json["hour"],
        month: json["month"],
        homeTeamName: json["homeTeamName"],
        homeTeamImage: json["homeTeamImage"],
        awayTeamName: json["awayTeamName"],
        awayTeamImage: json["awayTeamImage"],
        category: json["category"],
        tournament: json["tournament"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "day": day,
        "hour": hour,
        "month": month,
        "homeTeamName": homeTeamName,
        "homeTeamImage": homeTeamImage,
        "awayTeamName": awayTeamName,
        "awayTeamImage": awayTeamImage,
        "category": category,
        "tournament": tournament,
      };
}
