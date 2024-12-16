import 'package:flutter/material.dart';
import 'package:makemeover/view/Verification.dart';

class Forgottpassword extends StatefulWidget {
  const Forgottpassword({super.key});

  @override
  State<Forgottpassword> createState() => _ForgottpasswordState();
}

class _ForgottpasswordState extends State<Forgottpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.brown[800]?.withOpacity(0.5),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 160,
                ),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                Text('Enter your email to reset password'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VerificationPage()),
              );
            },
            child: const Text(
              'Continue',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[400], // Background color
              // Text color
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 20,
              ), // Padding
              shape: const StadiumBorder(
                  // Rounded corners
                  ),
              elevation: 5, // Shadow elevation
            ),
          ),
        ],
      ),
    );
  }
}
