import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animal_disease_helper/models/animal.dart';
import 'package:animal_disease_helper/screens/animal_tile.dart';

class AnimalList extends StatefulWidget {
  const AnimalList({super.key});

  @override
  State<AnimalList> createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  @override
  Widget build(BuildContext context) {
    final animals = Provider.of<List<Animal>>(context);

    return ListView.builder(
      itemCount: animals.length,
      itemBuilder: (context, index) {
        return AnimalTile(animal: animals[index]);
      },
    );
  }
}
