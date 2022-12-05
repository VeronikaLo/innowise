import 'package:equatable/equatable.dart';
import 'package:test_assesment/src/domain/entities/pokemon_list_entity.dart';

class PokemonListModel extends PokemonListEntity with EquatableMixin {
  PokemonListModel({required int id, required String name})
      : super(id:id, name: name);

  factory PokemonListModel.fromJson(Map<String, dynamic> json) { // from Json
    final url = json['url'] as String;
    final newId = int.parse(url.split('/')[6]);
    return PokemonListModel(
      id: newId,  
      name: json['name']);
  }

  Map<String, dynamic> toJson() {       // to Json
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
