import 'dart:convert';

import 'package:bayteq_challenge/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonProvider {

  static Future<Pokemon> fetchPokemon(String url) async {
    final response = await http.get(
      Uri.parse(url)
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch item");
    }

    final body = jsonDecode(response.body);
    return Pokemon.fromJson(body);
  }
}