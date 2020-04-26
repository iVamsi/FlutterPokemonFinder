import 'package:flutter/material.dart';
import 'package:pokemonfinder/routes/pokemon_detail_route.dart';
import 'package:pokemonfinder/routes/pokemon_screen_route.dart';
import 'package:pokemonfinder/screens/pokemon_detail_screen.dart';
import 'package:pokemonfinder/screens/pokemon_screen.dart';

class PokemonFinderApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon Finder",
      initialRoute: PokemonScreenRoute.routeName,
      routes: {
        PokemonScreenRoute.routeName : (context) => PokemonScreen(),
        PokemonDetailRoute.routeName : (context) => PokemonDetailScreen()
      }
    );
  }
}
