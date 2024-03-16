import 'package:flutter/material.dart';
import 'package:animal_disease_helper/models/animal.dart';

class AnimalTile extends StatelessWidget {
  final Animal animal;

  const AnimalTile({super.key, required this.animal});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/symptoms',
              arguments: {
                "symptoms":animal.diseases.values.expand((disease) => disease.symptoms)
                    .toList(),
                "animalName": animal.animalName,
                "diseaseMap": animal.diseases
              },
            );
          },
          title: Center(
              child: Text(
                  animal.animalName,
                style: const TextStyle(
                  fontSize: 23.0
                ),
              ),
          ),
        ),
      ),
    );
  }
}
