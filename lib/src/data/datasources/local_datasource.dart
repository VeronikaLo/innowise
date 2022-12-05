import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/errors/exception.dart';
import '../models/pokemon_list_model.dart';
import '../models/pokemon_model.dart';


abstract class LocalDataSource{
  /// Creates and gets the cached data from the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<void> pokemonsListToCache(List<PokemonListModel> pokemonsList);// to cache
  Future<void> pokemonToCache(PokemonModel pokemon);

  Future<List<PokemonListModel>> pokemonsListFromCache();       // from cache
  Future<PokemonModel> pokemonFromCache();
}

// ignore: constant_identifier_names
const CACHED_POKEMONS_LIST = 'CACHED_POKEMONS_LIST';
// ignore: constant_identifier_names
const CACHED_POKEMON = 'CACHED_POKEMON';

class LocalDataSourceImpl implements  LocalDataSource{
final SharedPreferences sharedPreferences;

LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> pokemonsListToCache(List<PokemonListModel> pokemonsList) {  // to local storage/ cache
    
    final List<String> jsonPokemonsList =
        pokemonsList.map((el) => json.encode(el.toJson())).toList();
    sharedPreferences.setStringList(CACHED_POKEMONS_LIST, jsonPokemonsList);
    return Future.value(jsonPokemonsList);
  }
  
  @override
  Future<void> pokemonToCache(PokemonModel pokemon) {  // to local storage/ cache
    
    final String jsonPokemon = json.encode(pokemon.toJson());
    sharedPreferences.setString(CACHED_POKEMON, jsonPokemon);
    return Future.value(jsonPokemon);
  }
  
  
  @override
  Future<PokemonModel> pokemonFromCache() {  //  from chache
    final jsonPokemon =
        sharedPreferences.getString(CACHED_POKEMON);
    if (jsonPokemon!.isNotEmpty) {  // if cache is not empty
      // return Future.value(jsonPokemons
      //     .map((element) => PokemonModel.fromJson(json.decode(element)))
      //     .toList());
      return Future.value(PokemonModel.fromJson(json.decode(jsonPokemon)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<PokemonListModel>> pokemonsListFromCache() {     // from chache
    final jsonPokemonsList =
        sharedPreferences.getStringList(CACHED_POKEMONS_LIST);
    if (jsonPokemonsList!.isNotEmpty) {  // if cache is not empty
      return Future.value(jsonPokemonsList
          .map((element) => PokemonListModel.fromJson(json.decode(element)))
          .toList());
    } else {
      throw CacheException();
    }
  }
  

  
  
  

}