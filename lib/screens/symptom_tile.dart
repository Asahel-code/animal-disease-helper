import 'package:flutter/material.dart';
import 'package:animal_disease_helper/models/animal.dart';

class SymptomTile extends StatelessWidget {
  final String symptom;
  final Map<String, Disease> diseaseMap;

  const SymptomTile({super.key, required this.symptom, required this.diseaseMap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/disease',
          arguments: {
            "symptom": symptom,
            "diseaseMap": diseaseMap
          }
        );
      },
      title: Center(
        child: Text(symptom),
      ),
    );
  }
}
