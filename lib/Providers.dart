import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:makemeover/view/whisList.dart';
import 'package:makemeover/viewmodel/firestoreService.dart';

// fetchName provider class;

class ShopProvider with ChangeNotifier {
  String artistName = 'Loading...';

  fetchArtistName(String shopId) async {
    if (shopId.isEmpty) {
      artistName = 'Invalid Shop ID';
      notifyListeners();
      return;
    }
    try {
      DocumentSnapshot shop =
          await FirebaseFirestore.instance.collection('shop').doc(shopId).get();

      if (shop.exists && shop.data() != null) {
        artistName = shop['Name'] ?? 'Unknown Artist';
      } else {
        artistName = 'Unknown Artist';
      }
    } catch (e) {
      artistName = 'Error loading artist';
    }
    notifyListeners();
  }
}

class WishlistProvider extends ChangeNotifier {
  final FirestoreService firestoreService = FirestoreService();
// final List<> favorite
  List<Map<String, dynamic>> wishlist = [];
  List<Map<String, dynamic>> cards = [];
  bool isLoading = false;

  // Fetch cards from Firestore
  Future<void> fetchCards() async {
    isLoading = true;
    notifyListeners();

    try {
      final List<Map<String, dynamic>> fetchedCards =
          await firestoreService.fetchCards();
      cards = fetchedCards;
    } catch (e) {
      print('Error fetching cards: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Add card to wishlist
  void addToWishlist(Map<String, dynamic> card) {
    if (!wishlist.contains(card)) {
      wishlist.add(card);
      notifyListeners();
    }
  }

  // Remove card from wishlist
  void removeFromWishlist(Map<String, dynamic> card) {
    wishlist.remove(card);
    notifyListeners();
  }

  // Check if card is in wishlist
  bool isCardInWishlist(Map<String, dynamic> card) {
    return wishlist.contains(card);
  }

  // Toggle card in wishlist
  void toggleWishlist(Map<String, dynamic> card) {
    if (isCardInWishlist(card)) {
      removeFromWishlist(card);
    } else {
      addToWishlist(card);
    }
  }
}

class IconProvider with ChangeNotifier {
  final Map<String, bool> addicon = {};
  bool isAddicon(String id) {
    return addicon[id] ?? true;
  }

  void toggleIcon(id) {
    addicon[id] = !(addicon[id] ?? true);
    notifyListeners();
  }
}
