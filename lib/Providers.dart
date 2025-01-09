import 'package:flutter/material.dart';

// class WishlistProvider extends ChangeNotifier {
//   final List<Map<String, String>> _Wishlist = [];

//   List<Map<String, String>> get Wishlist => _Wishlist;

//   void addToWishlist(Map<String, String> artist) {
//     _Wishlist.add(artist);
//     notifyListeners();
//   }

//   void removeItem(String artist) {
//     _Wishlist.remove(artist);
//     notifyListeners();
//   }

//   bool isInWishlist(Map<String, String> artist) {
//     return _Wishlist.contains(artist);
//   }
// }

class Datepicker extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  void updateDate(DateTime newDate) {
    selectedDate = newDate;
    Future<void> selectDate(BuildContext context) async {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (selectedDate != null) {
        updateDate(newDate);
      }
      notifyListeners();
    }
  }
}

class TimeProvider with ChangeNotifier {
  final TextEditingController timeController = TextEditingController();

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      timeController.text = selectedTime.format(context);
      notifyListeners();
    }
  }
}
