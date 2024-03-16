import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animal_disease_helper/models/animal.dart';

class DatabaseService {
  final CollectionReference animalCollection =
  FirebaseFirestore.instance.collection('animals');

  List<Animal> animalListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Animal.fromJson(data);
    }).toList();
  }

  Stream<List<Animal>> get animals {
    return animalCollection.snapshots().map(animalListFromSnapShot);
  }
}
