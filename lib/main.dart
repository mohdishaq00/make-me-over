import 'package:flutter/material.dart';
import 'package:makemeover/aboutus.dart';
// import 'package:makemeover/aboutus.dart';rRR
// import 'package:makemeover/LoginPage.dart';
// import 'package:makemeover/home.dart';
// import 'package:makemeover/profile.dart';
import 'package:makemeover/firebase_options.dart';
//  import 'package:makemeover/profile.dart';
//  import 'package:makemeover/view/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
// import 'package:makemeover/profile.dart';
import 'package:makemeover/view/overview.dart';

=======
import 'package:makemeover/view/artistProfile.dart';
import 'package:makemeover/view/home.dart';
>>>>>>> fc8d75472e54910de63946771a61253ae5d11777

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      home: Overview(),
    );
=======
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          // '/Stephy': (context) => const MyWidget(name),
        });
>>>>>>> fc8d75472e54910de63946771a61253ae5d11777
  }
}
