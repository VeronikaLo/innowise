

import 'package:flutter/material.dart';
import 'package:test_assesment/src/domain/entities/pokemon_entity.dart';

class PokemonItem extends StatelessWidget {
  final PokemonEntity pokemon;
  

  const PokemonItem({super.key, required this.pokemon});

    
  
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    var weight = (pokemon.weight/10).toString();   // the pokemon's weight in KG
    var height = (pokemon.height*10).toString();   // the pokemon's height in sm

    Widget textElement(String text, String value){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(text, style: themeData.textTheme.headline1, ),
    Text(value, style: themeData.textTheme.headline1, ),
  ],);
} 
    
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width:350,
        height: 450,
        margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.white60, Colors.white10]),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 2, color: Colors.white30),
          ),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(pokemon.name.toUpperCase(), style: themeData.textTheme.bodyText1,),
            SizedBox(
              width: 180,
              height: 150,
              child: Image.network(pokemon.imageUrl, fit: BoxFit.cover,)
            ),
            
            const SizedBox(height: 20,),
            textElement('Weight:', '$weight kg' ),
            textElement('Height:', '$height cm'),
            textElement('Types:', (pokemon.types).join(', ')),
  
          ] ,)
      )),
    ); 
  }
}

