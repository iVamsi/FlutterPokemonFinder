class PokemonResponse {
  final List<Pokemon> pokemonList;

  PokemonResponse.fromJson(Map<String, dynamic> parsedJson):
      pokemonList = (parsedJson["results"] as List)
          .map((pokemonJson) => Pokemon.fromJson(pokemonJson))
          .toList();
}

class Pokemon {
  final String name;
  final String url;

  Pokemon.fromJson(Map<String, dynamic> parsedJson):
      name = parsedJson["name"],
      url = parsedJson["url"];
}