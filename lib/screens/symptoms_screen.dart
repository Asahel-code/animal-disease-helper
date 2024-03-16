import 'package:animal_disease_helper/screens/symptom_tile.dart';
import 'package:flutter/material.dart';
import 'package:animal_disease_helper/models/animal.dart';

class SymptomsScreen extends StatelessWidget {
  final List<String> symptoms;
  final String animalName;
  final Map<String, Disease> diseaseMap;

  const SymptomsScreen({super.key, required this.symptoms, required this.animalName, required this.diseaseMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('$animalName disease symptoms'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two symptoms per row
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
          ),
            itemCount: symptoms.length,
            itemBuilder: (context, index) {
              return Card(
                child: SymptomTile(symptom: symptoms[index], diseaseMap: diseaseMap),
              );
            }),
      ),
    );
  }
}

