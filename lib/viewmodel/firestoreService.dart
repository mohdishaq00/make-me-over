import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fetch all cards from Firestore
  Future<List<Map<String, dynamic>>> fetchCards() async {
    try {
      final shopshot = await firestore.collection('shop').get();
      return shopshot.docs
          .map(
            (doc) => doc.data(),
          )
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching cards: $e');
      return [];
    }
  }
}
