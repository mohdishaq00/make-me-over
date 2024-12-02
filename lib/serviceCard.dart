import 'package:flutter/material.dart';

class Servicecard extends StatelessWidget {
  final String title; // Text for the button
  final ImageProvider image;

  const Servicecard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 107, 73, 61),
                    width: 1.5,
                  ),
                ),
              ),
              onPressed: () {
                _showPopup(context);
              },
              child: Image(
                image: image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              title,
              style: const TextStyle(
                  // fontFamily: 'ShortBaby',
                  color: Color.fromARGB(255, 95, 74, 68),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

void _showPopup(dynamic context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Wait Bro..'),
        content: const Padding(
          padding: EdgeInsets.only(left: 52, top: 35),
          child: Text(
            'Coming Soon..!',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the popup
            },
            child: const Text('Done'),
          ),
        ],
      );
    },
  );
}
