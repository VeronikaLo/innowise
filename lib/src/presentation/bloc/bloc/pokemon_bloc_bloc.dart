// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:test_assesment/src/domain/usecases/usecase.dart';
import 'package:test_assesment/src/domain/entities/pokemon_entity.dart';

import '../../../../core/errors/failure.dart';

part 'pokemon_bloc_event.dart';
part 'pokemon_bloc_state.dart';


const CACHED_FAILURE_MESSAGE = "Ups, something went wrong. Please try again!";
const SERVER_FAILURE_MESSAGE = "Ups, server error. Please try again!";

class PokemonBlocBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  final UseCases useCases;
  final int id;
  PokemonBlocBloc(this.id, {required this.useCases} ) : super(PokemonBlocInitial()) {
    
    on<GetPokemonEvent>((event, emit) async{
      
      Either<Failure, PokemonEntity> dataOrFailure = await useCases.getPokemon(id);
    dataOrFailure.fold(
      (failure) => emit(PokemonError(message: _mapFailureToMessage(failure))), 
      (data) => emit(PokemonLoaded(pokemon: data)));
      });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;

      default:
        return CACHED_FAILURE_MESSAGE;
    }
  }

}
