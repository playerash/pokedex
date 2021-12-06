import 'package:flutter/material.dart';
import 'package:pokedex/app/home_page/components/home_done.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/repository/pokemon_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.repository}) : super(key: key);
  final List<Pokemon> list;
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeDone();
        } else {
          return Center(
            child: Text("Erro"),
          );
        }
      }),
    );
  }
}
