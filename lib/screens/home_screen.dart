import 'package:animal_disease_helper/screens/animal_list.dart';
import 'package:animal_disease_helper/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animal_disease_helper/models/animal.dart';
import 'package:animal_disease_helper/services/database.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Animal>>.value(
      initialData: [], // Provide an empty list as initial data
      value:  DatabaseService().animals,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Animal list'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: Consumer<List<Animal>>(
          builder: (context, animalList, _) {
            if (animalList.isEmpty) {
              return const Loading(); // Handle empty list
            }
            return const AnimalList(); // Pass list of animals to AnimalList widget
          },
        ),
      ),
    );
  }
}
