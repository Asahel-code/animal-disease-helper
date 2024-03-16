import 'package:flutter/material.dart';
import 'package:animal_disease_helper/models/animal.dart';

class DiseaseScreen extends StatelessWidget {
  final String selectedSymptom;
  final Map<String, Disease> diseaseMap;

  const DiseaseScreen({super.key, required this.selectedSymptom, required this.diseaseMap});

  String findDiseaseWithSymptom() {
    String result = "";
    diseaseMap.forEach((key, value) {
      if (value.symptoms.contains(selectedSymptom)) {
        result = key;
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    String matchingDisease = findDiseaseWithSymptom();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Possible disease'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
      ),
      body: Center(
        child:Text(
            matchingDisease,
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}
