import 'package:flutter/material.dart';
import 'package:pokedex/app/home_page/home_page.dart';
import 'package:pokedex/app/repository/pokemon_repository.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(list: [],repository: PokemonRepository(),),
    );
  }
}
