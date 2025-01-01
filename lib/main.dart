import 'package:flutter/material.dart';
import 'package:makemeover/model/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:makemeover/view/artistCard.dart';
import 'package:makemeover/view/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => IconProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}





// class WishlistProvider extends ChangeNotifier {
//   final List<Map<String, String>> _Wishlist = [];

//   List<Map<String, String>> get Wishlist => _Wishlist;

//   void addToWishlist(Map<String, String> item) {
//     _Wishlist.add(item);
//     notifyListeners();
//   }
//   bool isInWishlist(Map<String, String> item) {
//     return _Wishlist.contains(item);
//   }
// }

