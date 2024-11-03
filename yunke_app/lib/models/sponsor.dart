import 'dart:convert';

class Sponsor {
  bool available;
  String? image;
  String name;
  String? id;

  Sponsor({
    required this.available,
    this.image,
    required this.name,
  });

  factory Sponsor.fromJson(String str) => Sponsor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sponsor.fromMap(Map<String, dynamic> json) => Sponsor(
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
