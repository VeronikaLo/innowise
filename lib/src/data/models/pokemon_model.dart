import 'package:equatable/equatable.dart';
import 'package:test_assesment/src/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity with EquatableMixin {
  PokemonModel(
      {required int id,
      required String name,
      required String imageUrl,
      required List<String> types,
      required int weight,
      required int height})
      : super(
            id: id,
            name: name,
            imageUrl: imageUrl,
            types: types,
            weight: weight,
            height: height);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {  //
    return PokemonModel(
      id: json['id'], 
      name: json['name'],
      imageUrl: json['sprites']['front_shiny'],
      types: (json['types'] as List).map((typeJson) => typeJson['type']['name'] as String).toList(),
      weight: json['weight'],
      height: json['height']);
  }

  
  Map<String, dynamic> toJson() {       // to Json
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'types': types,
      'weight': weight,
      'height': height,
    };
  }

  @override
  List<Object?> get props => [id, name, imageUrl, types, weight, height];
}


