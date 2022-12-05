part of 'pokemon_bloc_bloc.dart';

abstract class PokemonBlocEvent extends Equatable {
  const PokemonBlocEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonEvent extends PokemonBlocEvent{}
