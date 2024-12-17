import 'package:flutter/material.dart';
import 'package:makemeover/firebase_options.dart';
import 'package:makemeover/view/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:makemeover/view/artistProfile.dart';
import 'package:makemeover/view/home.dart';

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
        debugShowCheckedModeBanner: false,
        home: Loginpage(),
        routes: {
          // '/Stephy': (context) => const MyWidget(name),
        });
  }
}
