import 'package:flutter/foundation.dart';
import 'package:pokemonfinder/models/pokemon_response.dart';

class PokemonDetailRoute {
  static final routeName = "pokemonDetailRoute";
  final Pokemon pokemon;

  PokemonDetailRoute({@required this.pokemon});
}