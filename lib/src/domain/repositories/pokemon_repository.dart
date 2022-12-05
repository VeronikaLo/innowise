import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../entities/pokemon_entity.dart';
import '../entities/pokemon_list_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonListEntity>>> getPokemonsList(int page);
  Future<Either<Failure, PokemonEntity>> getPokemon(int id);
}