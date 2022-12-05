

import 'package:flutter/material.dart';
import 'package:test_assesment/src/domain/entities/pokemon_entity.dart';

class PokemonItem extends StatelessWidget {
  final PokemonEntity pokemon;
  

  const PokemonItem({super.key, required this.pokemon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Column(
        children: [
          Text(pokemon.id.toString()),
          Text(pokemon.name),
          Text(pokemon.weight.toString()),
          Text(pokemon.height.toString()),
          Image.network(pokemon.imageUrl),
        ] ,)
    )); 
  }
}