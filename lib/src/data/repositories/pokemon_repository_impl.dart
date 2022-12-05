import 'package:test_assesment/core/errors/exception.dart';
import 'package:test_assesment/core/network_connaction/network_connection.dart';
import 'package:test_assesment/src/data/datasources/remote_datasource.dart';
import 'package:test_assesment/src/domain/entities/pokemon_list_entity.dart';
import 'package:test_assesment/src/domain/entities/pokemon_entity.dart';
import 'package:test_assesment/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_assesment/src/domain/repositories/pokemon_repository.dart';
import '../datasources/local_datasource.dart';



class PokemonRepositoryImpl implements PokemonRepository{
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkConnection networkConnection;

  PokemonRepositoryImpl({ required this.remoteDataSource, required this.localDataSource, required this.networkConnection});


  @override
  Future<Either<Failure, List<PokemonListEntity>>> getPokemonsList(int page) async{
    if(await networkConnection.isConnected){
      //
      try{  // we have-internet-case
      final remoteList = await remoteDataSource.getPokemonsList(page);
      localDataSource.pokemonsListToCache(remoteList);
      return Right(remoteList);
      }on ServerException{
        return  Left(ServerFailure());
      }
      
    }else{  // we don't have-internet-case
      try{
      final localList = await localDataSource.pokemonsListFromCache();
      return Right(localList);
      }on CacheException{
        return  Left(CacheFailure());
      } 
    }
  }


  @override
  Future<Either<Failure, PokemonEntity>> getPokemon(int id) async{
    if(await networkConnection.isConnected){
      //
      try{  // we have-internet-case
      final remotePokemon = await remoteDataSource.getPokemon(id);
      localDataSource.pokemonToCache(remotePokemon);
      return Right(remotePokemon);
      }on ServerException{
        return  Left(ServerFailure());
      }
      
    }else{  // we don't have-internet-case
      try{
      final localPokemon = await localDataSource.pokemonFromCache();
      return Right(localPokemon);
      }on CacheException{
        return  Left(CacheFailure());
      } 
    }
  }
  
}