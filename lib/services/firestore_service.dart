import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/city.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveCity(City city) async {
    print('Preparing to save to Firestore...');
    final docRef = FirebaseFirestore.instance.collection('cities').doc();
    print('Document reference: ${docRef.path}');

    final data = city.toJson();
    print('Data to save: $data');

    try {
      await docRef.set(data);
      print('Saved to Firestore!');
    } catch (e) {
      print('Error saving to Firestore: $e');
    }
  }


  Future<List<City>> getCities() async {
    try {
      final snapshot = await _db.collection('cities').get();
      return snapshot.docs.map((doc) => City.fromJson(doc.data())).toList();
    } catch (e) {
      print('Error fetching cities: $e');
      return [];
    }
  }
}
