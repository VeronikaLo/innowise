part of 'test_bloc_bloc.dart';

abstract class TestBlocState extends Equatable {
  const TestBlocState();
  
  @override
  List<Object> get props => [];
}

class TestBlocInitial extends TestBlocState {}
class TestBlocLoading extends TestBlocState {
  final List<PokemonListEntity> oldList;
  final bool isFirstCall;
  const TestBlocLoading(this.oldList, { this.isFirstCall = false});

  @override
  List<Object> get props => [oldList];
}
class TestBlocLoaded extends TestBlocState {
  final List<PokemonListEntity> list;
  const TestBlocLoaded({required this.list});

  @override
  List<Object> get props => [list];
}
class TestBlocError extends TestBlocState {
  final String message;

  const TestBlocError({required this.message});
  @override
  List<Object> get props => [message];
}
