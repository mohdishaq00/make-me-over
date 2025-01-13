import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';

void showPopup(
    {required BuildContext context,
    required String tiltle,
    required String subtilte}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(tiltle),
        content: Padding(
          padding: EdgeInsets.only(left: 52, top: 35),
          child: Text(textAlign: TextAlign.center, subtilte),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: const Text('Done'),
          ),
        ],
      );
    },
  );
}
