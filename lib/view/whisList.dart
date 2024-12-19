import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';

class Whislist extends StatefulWidget {
  const Whislist({super.key});

  @override
  State<Whislist> createState() => _WhislistState();
}

class _WhislistState extends State<Whislist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('whislist'),
            divider(boxWidth: 10),
            const Icon(
              Icons.bookmark_added,
            ),
            
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
