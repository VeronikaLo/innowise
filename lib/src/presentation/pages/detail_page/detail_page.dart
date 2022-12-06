import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_assesment/src/presentation/pages/detail_page/widget/pokemon_item.dart';

import '../../../domain/entities/pokemon_entity.dart';
import '../../bloc/cubit/pokemon_cubit.dart';
import '../home_page/widgets/error_message.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // const pokemon1 =  PokemonEntity(
    // id:2,
    // name: 'ivysaur',
    // imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/2.png',
    // types: ['grass, poison'],
    // height: 10,
    // weight: 130);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon', style: TextStyle(
      color: Colors.white,
      fontFamily: "CabinSketch",
      fontSize: 30,
      fontWeight: FontWeight.bold) ),
        centerTitle: true,
      ),
      body: //const PokemonItem(pokemon: pokemon1 ,)
        BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, pokState) {
          if (pokState is PokemonInitial) {
            return Container();
          } else if (pokState is PokemonLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            );
          } else if (pokState is PokemonLoaded) {
            
            return PokemonItem(
              pokemon: pokState.pokemon,
            );
          } else if (pokState is PokemonError) {
            return ErrorMessage(
              message: pokState.message,
            );
          }
          return const Placeholder();
        },
      ),
    );
  }
}


