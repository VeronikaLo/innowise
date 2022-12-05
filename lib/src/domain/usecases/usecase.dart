import 'package:dartz/dartz.dart';
import 'package:test_assesment/src/domain/repositories/pokemon_repository.dart';
import '../../../core/errors/failure.dart';
import '../entities/pokemon_entity.dart';
import '../entities/pokemon_list_entity.dart';

// class AdvicerUsecases {
//   final AdvicerRepository advicerRepository;
//   AdvicerUsecases({required this.advicerRepository});


//   Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
//     // call function from repository to get advice
//     return advicerRepository.getAdviceFromApi();

//     // Buisness logic implementieren z.b. rechnung etc
//   }

class UseCases{
  final PokemonRepository pokemonRepository;

  UseCases({required this.pokemonRepository});

  Future<Either<Failure, List<PokemonListEntity>>> getList(int page) async {
    // call function from repository to get list
    return pokemonRepository.getPokemonsList(page);
  }

  Future<Either<Failure, PokemonEntity>> getPokemon(int id) async {
    // call function from repository to get Pokemon
    return pokemonRepository.getPokemon(id);
  }

}