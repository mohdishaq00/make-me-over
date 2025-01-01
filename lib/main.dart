import 'package:makemeover/model/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:makemeover/providers.dart';
import 'package:makemeover/view/LoginPage.dart';
import 'package:makemeover/view/profile.dart';
import 'package:makemeover/bookingpage.dart';
import 'package:makemeover/view/home.dart';
import 'providers/WishlistProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'Wishlist_Providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
