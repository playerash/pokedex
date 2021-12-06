import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon.dart';

class HomeDone extends StatelessWidget {
  const HomeDone({Key? key, required this.list}) : super(key: key);
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index].name),
          );
        });
  }
}
