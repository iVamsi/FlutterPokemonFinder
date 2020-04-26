import 'package:flutter/material.dart';
import 'package:pokemonfinder/models/pokemon_details_response.dart';
import 'package:pokemonfinder/models/pokemon_response.dart';
import 'package:pokemonfinder/routes/pokemon_detail_route.dart';
import 'package:pokemonfinder/services/pokemon_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonDetailScreen extends StatefulWidget {
  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  PokemonSprites pokemonSprites;

  @override
  void didChangeDependencies() {
    PokemonDetailRoute pokemonDetailRoute = ModalRoute.of(context).settings.arguments;
    _fetchPokemonDetails(pokemonDetailRoute.pokemon);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pokemon Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: pokemonSprites == null ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.orangeAccent,
        ),
      ) : Row(
        children: <Widget>[
          Expanded(
            child: Image(
              image: CachedNetworkImageProvider(
                pokemonSprites.frontDefault
              ),
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
          ),
          Image(
            image: CachedNetworkImageProvider(
                pokemonSprites.backDefault
            ),
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width/2,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  void _fetchPokemonDetails(Pokemon pokemon) async {
    final result = await PokemonService().fetchPokemonDetails(pokemonDetailUrl: pokemon.url);

    setState(() {
      pokemonSprites = result.pokemonSprites;
    });
  }
}
