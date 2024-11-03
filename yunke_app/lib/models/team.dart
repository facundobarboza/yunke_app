import 'dart:convert';

class Team {
  bool available;
  String image;
  String name;
  String? id;

  Team({
    required this.available,
    required this.image,
    required this.name,
  });

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        available: json["available"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "image": image,
        "name": name,
      };
}
