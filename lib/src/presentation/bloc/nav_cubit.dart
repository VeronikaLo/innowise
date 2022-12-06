import 'package:flutter_bloc/flutter_bloc.dart';
//import '../../domain/entities/pokemon_entity.dart';
import 'cubit/pokemon_cubit.dart';

class NavCubit extends Cubit<int?> {
  PokemonCubit pokemonCubit;

  NavCubit({required this.pokemonCubit}) : super(null);

  void sendPokemon(int id) {
    pokemonCubit.hope(id);
    emit(id);
  }

  void clear() {
    emit(null);
  }
}
