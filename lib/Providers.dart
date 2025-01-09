import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'wishlist_provider.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Map<String, String>> _Wishlist = [];

  List<Map<String, String>> get Wishlist => _Wishlist;

  void addToWishlist(Map<String, String> item) {
    _Wishlist.add(item);
    notifyListeners();
  }

  bool isInWishlist(Map<String, String> item) {
    return _Wishlist.contains(item);
  }
}
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
