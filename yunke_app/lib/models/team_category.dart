import 'dart:convert';

enum Categories {
  masculino("masculino"),
  femenino("femnino");

  final String name;

  const Categories(this.name);
}

class TeamCategory {
  bool available;
  Categories categoryName;
  String name;
  String? id;

  TeamCategory({
    required this.available,
    required this.categoryName,
    required this.name,
  });

  factory TeamCategory.fromJson(String str) =>
      TeamCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamCategory.fromMap(Map<String, dynamic> json) => TeamCategory(
        available: json["available"],
        categoryName: json["categoryName"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "categoryName": categoryName,
        "name": name,
      };
}
