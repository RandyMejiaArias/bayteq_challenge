// To parse this JSON data, do
//
//     final tabItem = tabItemFromJson(jsonString);

import 'dart:convert';

class TabItem {
  TabItem({
    required this.tabIndex,
    required this.pokemonName,
    required this.url,
  });

  int tabIndex;
  String pokemonName;
  String url;

  factory TabItem.fromRawJson(String str) => TabItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TabItem.fromJson(Map<String, dynamic> json) => TabItem(
    tabIndex: json["tabIndex"],
    pokemonName: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "tabIndex": tabIndex,
    "pokemonName": pokemonName,
    "url": url,
  };
}
