import 'package:flutter/material.dart';
// import 'package:makemeover/bookingpage.dart';

import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
import 'package:makemeover/view/LoginPage.dart';
// import 'package:makemeover/profile.dart';
import 'package:makemeover/view/overview.dart';
=======
>>>>>>> d4687cc3c346f06fbc7c5cc87bbb6af4caf7f789

// import 'package:makemeover/view/artistCard.dart';
import 'package:makemeover/view/home.dart';
<<<<<<< HEAD
import 'package:makemeover/view/home.dart';
import 'package:makemeover/view/overview.dart';

=======

// import 'package:makemeover/view/aboutus.dart';
import 'package:makemeover/model/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:makemeover/view/LoginPage.dart';

//  import 'package:makemeover/view/home.dart';
// import 'package:makemeover/view/artistProfile.dart';
// import 'package:makemeover/view/home.dart';
// import 'package:makemeover/view/home.dart';
// import 'package:makemeover/view/overview.dart';
>>>>>>> d4687cc3c346f06fbc7c5cc87bbb6af4caf7f789

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
      home: HomePage(),
    );
       
=======
        debugShowCheckedModeBanner: false, home: HomePage () );
  
>>>>>>> d4687cc3c346f06fbc7c5cc87bbb6af4caf7f789
  }
}
