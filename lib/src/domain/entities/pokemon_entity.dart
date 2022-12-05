class PokemonEntity{
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int weight;
  final int height;

  const PokemonEntity({ 
    required this.id, 
    required this.name, 
    required this.imageUrl, 
    required this.types, 
    required this.weight, 
    required this.height});

}