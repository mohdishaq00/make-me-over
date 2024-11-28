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
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
              ),
              onPressed: () {
                print("Button with title '$title' pressed");
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
