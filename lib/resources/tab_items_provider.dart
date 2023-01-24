import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bayteq_challenge/models/tab_item_model.dart';

class TabItemsProvider {
  static const String _domain = "pokeapi.co";
  static const String _path = "/api/v2/pokemon/";

  static Future<List<TabItem>> fetchItems(int offset) async {
    final response = await http.get(
      Uri.https(
        _domain,
        _path,
        {"offset": "$offset", "limit": "3"},
      ),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch items");
    }

    final body = jsonDecode(response.body);
    final results = body["results"];

    for (var i = 0; i < results.length; i++) {
      results[i]["tabIndex"] = i;
    }
    
    return results.map<TabItem>((tabItem) => TabItem.fromJson(tabItem)).toList();
  }
}