import 'package:flutter/material.dart';
import 'package:pokedex/app/home_page/components/home_done.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/repository/pokemon_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key,  required this.repository}) : super(key: key);
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: repository.getAllPokemons(),
        builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeDone(list: snapshot.data!,);
        } else {
          return Center(
            child: Text("Erro"),
          );
        }
      }),
    );
  }
}
