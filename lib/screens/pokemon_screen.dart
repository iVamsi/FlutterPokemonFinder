import 'package:flutter/material.dart';
import 'package:pokemonfinder/models/pokemon_response.dart';
import 'package:pokemonfinder/routes/pokemon_detail_route.dart';
import 'package:pokemonfinder/services/pokemon_service.dart';

class PokemonScreen extends StatefulWidget {
  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final pokemonList = <Pokemon>[];
  @override
  void initState() {
    _fetchPokemon();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pokemon Finder",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: pokemonList.isNotEmpty?ListView.builder(
          itemCount: pokemonList.length,
        itemBuilder: (_, position) => getRow(position)
      ): Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget getRow(int i) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, PokemonDetailRoute.routeName, arguments: PokemonDetailRoute(pokemon: pokemonList[i])),
        title: Text(
            pokemonList[i].name ?? "Unknown",
        ),
      ),
    );
  }

  void _fetchPokemon() async {
    final pokemon = await PokemonService().fetchPokemon();
    setState(() {
      pokemonList.addAll(pokemon.pokemonList);
    });
  }
}
