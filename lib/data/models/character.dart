class Character {
  final int id;
  final String name;
  final String imageUrl;
  final String status;
  final String species;
  final String gender;

  Character({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.species,
    required this.gender,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
    );
  }
}
