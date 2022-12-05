import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/errors/exception.dart';
import '../models/pokemon_list_model.dart';
import '../models/pokemon_model.dart';


abstract class RemoteDataSource{
  /// Calls the https://pokeapi.co/api/v2/pokemon/?limit=10&offset=10 endpoint.
  /// Throws a [ServerException] for all error codes.
  Future<List<PokemonListModel>> getPokemonsList(int page);



  /// Calls the https://pokeapi.co/api/v2/pokemon/{id} endpoint.
  /// Throws a [ServerException] for all error codes.
  Future<PokemonModel> getPokemon(int id);
}


class RemoteDataSourceImpl implements RemoteDataSource{
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonListModel>> getPokemonsList(int page) async{
    
    final response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=20&offset=$page'), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      //print(results['results']);
      return (results['results'] as List)
          .map((element) => PokemonListModel.fromJson(element))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonModel> getPokemon(int id) async{
    final response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return PokemonModel.fromJson(results);
    
    } else {
      throw ServerException();
    }
  }

}

