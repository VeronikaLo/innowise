part of 'pokemon_cubit.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}
class PokemonLoading extends PokemonState {}
class PokemonLoaded extends PokemonState {
  final PokemonEntity pokemon;
  const PokemonLoaded({required this.pokemon});

  @override
  List<Object> get props => [pokemon];
}
class PokemonError extends PokemonState {
  final String message;

  const PokemonError({required this.message});
  @override
  List<Object> get props => [message];
}