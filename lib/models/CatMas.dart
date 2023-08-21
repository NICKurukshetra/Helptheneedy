// To parse this JSON data, do
//
//     final catMas = catMasFromJson(jsonString);

import 'dart:convert';

List<CatMas> catMasFromJson(String str) => List<CatMas>.from(json.decode(str).map((x) => CatMas.fromJson(x)));

String catMasToJson(List<CatMas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatMas {
    CatMas({
        this.id,
        this.category,
        this.topic,
        this.icon,
    });

    int id;
    String category;
    dynamic topic;
    String icon;

    factory CatMas.fromJson(Map<String, dynamic> json) => CatMas(
        id: json["id"],
        category: json["category"],
        topic: json["topic"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "topic": topic,
        "icon": icon,
    };
}
