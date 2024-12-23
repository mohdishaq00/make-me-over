import 'package:flutter/material.dart';
import 'package:makemeover/view/Verification.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgottpassword extends StatefulWidget {
  const Forgottpassword({super.key});

  @override
  State<Forgottpassword> createState() => _ForgottpasswordState();
}

class _ForgottpasswordState extends State<Forgottpassword> {
  final _emailController = TextEditingController();
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('reset link send');
      // Handle success, e.g., show a success message
    } on FirebaseAuthException catch (e) {
      print('RESET ERROR $e');
      // Handle errors, e.g., show error messages
      print(e.message);
    }
  }

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
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              resetPassword(_emailController.text.trim()).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Password reset email sent.'),
                  ),
                );
                Navigator.pop(context);
              }).catchError((error) {
                // Handle errors, e.g., show error messages
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: $error'),
                  ),
                );
              });

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const VerificationPage()),
              // );
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
