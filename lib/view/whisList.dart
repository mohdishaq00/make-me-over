import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';


class Whislist extends StatelessWidget { 
  const Whislist({
    super.key, 
  });

  // final List<dynamic> wishlist;
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
