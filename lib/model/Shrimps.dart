class ShrimpModel {
  final String Image,
      name,
      kingdom,
      phylum,
      klass,
      ordo,
      family,
      genus,
      species,
      description;

  ShrimpModel({
    required this.Image,
    required this.name,
    required this.kingdom,
    required this.phylum,
    required this.klass,
    required this.ordo,
    required this.family,
    required this.genus,
    required this.species,
    required this.description,
  });

  factory ShrimpModel.fromJSON(Map parsedJson) {
    return ShrimpModel(
        Image: parsedJson['Image'],
        name: parsedJson['name'],
        kingdom: parsedJson['kingdom'],
        phylum: parsedJson['phylum'],
        klass: parsedJson['class'],
        ordo: parsedJson['ordo'],
        family: parsedJson['family'],
        genus: parsedJson['genus'],
        species: parsedJson['species'],
        description: parsedJson['description']);
  }
}
