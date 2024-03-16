class Animal {
  final String animalName;
  final Map<String, Disease> diseases;

  Animal({required this.animalName, required this.diseases});

  factory Animal.fromJson(Map<String, dynamic> json) {
    Map<String, Disease> diseasesMap = {};
    json['dieases'].forEach((key, value) {
      diseasesMap[key] = Disease.fromJson(value);
    });
    return Animal(
      animalName: json['animal_name'],
      diseases: diseasesMap,
    );
  }
}

class Disease {
  final List<String> symptoms;

  Disease({required this.symptoms});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      symptoms: List<String>.from(json['symptoms']),
    );
  }
}