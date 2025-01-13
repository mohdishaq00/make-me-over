import 'package:flutter/material.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/model/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:makemeover/view/artistCard.dart';
import 'package:makemeover/view/home.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/view/updateShop.dart';
import 'package:provider/provider.dart';
// import 'package:makemeover/view/updateShop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IconProvider()),
      ChangeNotifierProvider(create: (_) => Datepicker()),
      ChangeNotifierProvider(create: (_) => TimeProvider()),
      // ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ChangeNotifierProvider(
        create: (_) => IconProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => IconProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => Shopsnap(),
      ),
      ChangeNotifierProvider(
        create: (context) => ShopProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'updateShop': (context) => Updateshop(),
      },
    );
  }
}
