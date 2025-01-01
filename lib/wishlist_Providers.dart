

import 'package:flutter/material.dart';


class WishlistProvider extends ChangeNotifier {
  final List<Map<String, String>> _Wishlist = [];

  List<Map<String, String>> get Wishlist => _Wishlist;

  void addToWishlist(Map<String, String> artist) {
    _Wishlist.add(artist);
    _Wishlist.add(artist);
    notifyListeners();
  }

  void removeItem(String artist) {
    _Wishlist.remove(artist);
    notifyListeners();
  }

  bool isInWishlist(Map<String, String> artist) {
    return _Wishlist.contains(artist);
  }
}
