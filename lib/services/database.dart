import 'package:auth_flutter/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference collection =
      Firestore.instance.collection('collection');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await collection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> _brewListFormSnapShot(QuerySnapshot shanpshot) {
    return shanpshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return collection.snapshots().map(_brewListFormSnapShot);
  }
}
