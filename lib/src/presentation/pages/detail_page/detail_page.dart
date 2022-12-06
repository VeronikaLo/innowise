import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_assesment/src/presentation/pages/detail_page/widget/pokemon_item.dart';

import '../../bloc/cubit/pokemon_cubit.dart';
import '../home_page/widgets/error_message.dart';

class DetailPage extends StatelessWidget {
  //final int id;
  //final PokemonEntity pokemon;
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
        centerTitle: true,
      ),
      body: Container()
      
      //Text(id.toString())
      //     BlocBuilder<PokemonCubit, PokemonState>(
      //   builder: (context, pokState) {
      //     if (pokState is PokemonInitial) {
      //       return Container();
      //     } else if (pokState is PokemonLoading) {
      //       return const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.pink,
      //         ),
      //       );
      //     } else if (pokState is PokemonLoaded) {
      //       return PokemonItem(
      //         pokemon: pokState.pokemon,
      //       );
      //     } else if (pokState is PokemonError) {
      //       return ErrorMessage(
      //         message: pokState.message,
      //       );
      //     }
      //     return const Placeholder();
      //   },
      // ),
    );
  }
}
