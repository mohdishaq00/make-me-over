import 'package:flutter/material.dart';

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
          ),Padding(
            padding: const EdgeInsets.symmetric(horizontal: 500),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
