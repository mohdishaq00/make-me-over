import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final TextEditingController dateController = TextEditingController();
    Future<void> selectDate(BuildContext context) async {
     final Datepicker = await showRangePickerDialog(
      context: context,
      initialDate: DateTime(2022, 10, 10),
      minDate: DateTime(2020, 10, 10),
      maxDate: DateTime(2024, 10, 30),
      
);
  
      if (newDate != selectedDate) {
        selectedDate = newDate;
        dateController.text = DateFormat('dd-MM-yyyy').format(newDate);
        notifyListeners();
      }
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

class MakeupService extends ChangeNotifier {
  String? selectedserives;
  List<String> services = [
    'Bridal Makeup',
    'party Makeup',
    'Facial',
    'Modeling Makeup',
    'Manicure',
    'Others'
  ];
  MakeupService? selectedservice;
  TextEditingController serviceController = TextEditingController();
  MakeupService? get selectedService => selectedservice;

  void setselectedservice(stringvalue) {
    selectedservice = stringvalue;
    serviceController.text = stringvalue;
    notifyListeners();
  }
}
