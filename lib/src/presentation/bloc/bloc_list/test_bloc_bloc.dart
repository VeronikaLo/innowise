// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_assesment/src/domain/usecases/usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../../domain/entities/pokemon_list_entity.dart';

part 'test_bloc_event.dart';
part 'test_bloc_state.dart';

const CACHED_FAILURE_MESSAGE = "Ups, something went wrong. Please try again!";
const SERVER_FAILURE_MESSAGE = "Ups, server error. Please try again!";

class TestBlocBloc extends Bloc<TestBlocEvent, TestBlocState> {
  final UseCases usecases;

  TestBlocBloc({required this.usecases}) : super(TestBlocInitial()) {
    int index = 20;
    int page = 0 * index;

    on<GetListEvent>((event, emit) async {
      if (state is TestBlocLoading) return;
      final currentState = state;
      var oldList = <PokemonListEntity>[];

      if (currentState is TestBlocLoaded) {
        oldList = currentState.list;
      }
      emit(TestBlocLoading(oldList, isFirstCall: page == 0));

      Either<Failure, List<PokemonListEntity>> listOrFailure =
          await usecases.getList(page);
      listOrFailure.fold(
          (failure) =>
              emit(TestBlocError(message: _mapFailureToMessage(failure))),
          (list) {
        page = (page + 1) * index;
        final newList = (state as TestBlocLoading).oldList;
        newList.addAll(list);
        emit(TestBlocLoaded(list: newList));
        //print(page);
      });
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
