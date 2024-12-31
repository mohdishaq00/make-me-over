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
