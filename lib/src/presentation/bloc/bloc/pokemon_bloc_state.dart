part of 'pokemon_bloc_bloc.dart';

abstract class PokemonBlocState extends Equatable {
  const PokemonBlocState();
  
  @override
  List<Object> get props => [];
}

class PokemonBlocInitial extends PokemonBlocState {}
class PokemonLoaded extends PokemonBlocState {
  final PokemonEntity pokemon;
  const PokemonLoaded({required this.pokemon});

  @override
  List<Object> get props => [pokemon];
}
class PokemonError extends PokemonBlocState {
  final String message;

  const PokemonError({required this.message});
  @override
  List<Object> get props => [message];
}
