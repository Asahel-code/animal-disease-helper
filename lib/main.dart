import 'package:animal_disease_helper/screens/disease_screen.dart';
import 'package:animal_disease_helper/screens/home_screen.dart';
import 'package:animal_disease_helper/screens/symptoms_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:animal_disease_helper/models/animal.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/symptoms': (context) {
          final Map<String, dynamic> args = ModalRoute
              .of(context)!
              .settings
              .arguments as Map<String, dynamic>;
          final List<String> symptoms = args['symptoms'];
          final String animalName = args['animalName'];
          final Map<String, Disease> diseaseMap = args['diseaseMap'];
          return SymptomsScreen(symptoms: symptoms, animalName: animalName, diseaseMap: diseaseMap);
        },
        '/disease': (context) {
          final Map<String, dynamic> args = ModalRoute
              .of(context)!
              .settings
              .arguments as Map<String, dynamic>;
          final String selectedSymptom = args['symptom'];
          final Map<String, Disease> diseaseMap = args['diseaseMap'];
          return DiseaseScreen(selectedSymptom: selectedSymptom, diseaseMap: diseaseMap);
        },
      }
    );
  }
}

