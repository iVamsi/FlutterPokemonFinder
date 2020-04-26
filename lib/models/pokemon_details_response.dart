class PokemonDetailsResponse {
  final PokemonSprites pokemonSprites;

  PokemonDetailsResponse.fromJson(Map<String, dynamic> parsedJson):
      pokemonSprites = PokemonSprites.fromJson(parsedJson["sprites"]);
}

class PokemonSprites {
  final String backDefault;
  final String frontDefault;

  PokemonSprites.fromJson(Map<String, dynamic> parsedJson):
      backDefault = parsedJson["back_default"],
      frontDefault = parsedJson["front_default"];
}