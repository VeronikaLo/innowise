import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/src/presentation/bloc/nav_cubit.dart';

class ListItem extends StatelessWidget {
  final String name;
  final int id;
  const ListItem({required this.name, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NavCubit>(context).sendPokemon(id);
      },
      child: Container(
        width: 200,
        height: 120,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.white60, Colors.white10]),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2, color: Colors.white30),
        ),
        child: Row(children: [
          Image.asset('assets/images/pokemon-ball.png'),
          const SizedBox(width: 10),
          Text(name,
              style: const TextStyle(
                  fontFamily: 'CabinSketch',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ]),
      ),
    );
  }
}
