
import 'package:flutter/material.dart';
import 'package:test_assesment/src/presentation/pages/home_page/widgets/pokemon_list.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(title: const Text(' WELCOME HOME', style: TextStyle(fontFamily: 'CabinSketch', fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold )), centerTitle: true, backgroundColor: Colors.black54,),
      body:  PokemonList(),
    );
  }
}



