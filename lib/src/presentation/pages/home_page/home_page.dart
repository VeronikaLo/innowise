import 'package:flutter/material.dart';
import 'package:test_assesment/src/presentation/pages/home_page/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          ' WELCOME HOME',
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: PokemonList(),
    );
  }
}
