import 'dart:convert';

class Player {
  bool available;
  String? image;
  String name;
  String lastName;
  String? number;
  String? id;

  Player({
    required this.available,
    this.image,
    required this.name,
    required this.lastName,
    this.number,
  });

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        available: json["available"],
        image: json["image"],
        name: json["name"],
        lastName: json["lastName"],
        number: json["number"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "image": image,
        "name": name,
        "lastName": lastName,
        "number": number,
      };
}
