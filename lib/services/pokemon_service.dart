import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' show Client;
import 'package:pokemonfinder/models/pokemon_details_response.dart';
import 'package:pokemonfinder/models/pokemon_response.dart';

class PokemonService {
  final Client client = Client();
  final String pokemonUrl = "https://pokeapi.co/api/v2/pokemon?limit=151";

  Future<PokemonResponse> fetchPokemon() async {
    final response = await client.get(pokemonUrl);
    print(pokemonUrl);

    final json = jsonDecode(response.body);
    print(json);

    return PokemonResponse.fromJson(json);
  }

  Future<PokemonDetailsResponse> fetchPokemonDetails({@required String pokemonDetailUrl}) async {
    final response = await client.get(pokemonDetailUrl);
    print(pokemonDetailUrl);

    final json = jsonDecode(response.body);
    print(json);

    return PokemonDetailsResponse.fromJson(json);
  }
}