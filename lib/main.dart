import 'package:flutter/material.dart';
import 'package:makemeover/Providers.dart';
import 'package:makemeover/model/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:makemeover/view/artistCard.dart';
import 'package:makemeover/view/home.dart';
import 'package:makemeover/view/profile.dart';
import 'package:makemeover/view/updateShop.dart';
import 'package:provider/provider.dart';

//  import 'package:makemeover/view/home.dart';
// import 'package:makemeover/view/artistProfile.dart';
// import 'package:makemeover/view/home.dart';
// import 'package:makemeover/view/home.dart';
// import 'package:makemeover/view/overview.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Shopsnap(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShopProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => IconProvider(),
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
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        // 'updateShop': (context) => Updateshop(),
     'artistPage':(context)=>profilepage(),
      },
    );
  }}   

