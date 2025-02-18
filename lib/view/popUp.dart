import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';

void showPopup(
    {required BuildContext context,
    // required final NavigatorState navigator,
    required String tiltle,
    required String subtilte,
    String? confirmTitle1,
    required String confirmTitle2,
    final VoidCallback? onPressed1,
    final VoidCallback? onPressed2}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blueGrey,
        title: Text(tiltle),
        content: Padding(
          padding: EdgeInsets.only(left: 0, top: 35),
          child: Text(
            textAlign: TextAlign.center,
            subtilte,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
        actions: [
          TextButton(
            onPressed: onPressed1,
            child: Text(
              confirmTitle1!,
              style: TextStyle(color: Colors.blueGrey[50]),
              selectionColor: Colors.blue[50],
            ),
          ),
          TextButton(
            onPressed: onPressed2,
            child: Text(
              confirmTitle2,
              style: TextStyle(color: Colors.blueGrey[50]),
            ),
          ),
        ],
      );
    },
  );
}
