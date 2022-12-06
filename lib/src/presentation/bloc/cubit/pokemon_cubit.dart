// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assesment/core/errors/failure.dart';
import 'package:test_assesment/src/domain/usecases/usecase.dart';
import '../../../domain/entities/pokemon_entity.dart';

part 'pokemon_state.dart';

const CACHED_FAILURE_MESSAGE = "Ups, something went wrong. Please try again!";
const SERVER_FAILURE_MESSAGE = "Ups, server error. Please try again!";

class PokemonCubit extends Cubit<PokemonState> {
  final UseCases usecases;
  PokemonCubit({required this.usecases}) : super(PokemonInitial());

  void hope(int id) async {
    Either<Failure, PokemonEntity> dataOrFailure =
        await usecases.getPokemon(id);
    dataOrFailure.fold(
        (failure) => emit(PokemonError(message: _mapFailureToMessage(failure))),
        (data) {
      print(data);
      emit(PokemonLoaded(pokemon: data));
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
