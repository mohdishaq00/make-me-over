// import 'dart:ffi' as ffi;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makemeover/view/home.dart';
// import 'package:makemeover/bookingpage.dart';

class Addshop extends StatefulWidget {
  const Addshop({super.key});

  @override
  State<Addshop> createState() => _AddshopState();
}

class _AddshopState extends State<Addshop> {
  final category = ['Haircut', 'Facial', 'Menicure', 'Pedicure'];
  final CollectionReference shop =
      FirebaseFirestore.instance.collection('shop');
  void addShop() {
    final data = {'name': 'Retro', 'phone': '123456789', 'category': 'haircut'};
    shop.add(data);
  }

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 216, 216),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(160, 228, 198, 188),
        title: Text('Add Your Shop'),
      ),
      body: Center(
        child: Column(
          children: [
            divider(boxHeight: 20),
            Text(
              'Please fill your shop details',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  wordSpacing: 5,
                  color: const Color.fromARGB(71, 120, 120, 120)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                SizedBox(
                  width: 400,
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'phone',
                      // hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 400,
              height: 100,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Category  z',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                items: category
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  {
                    selectedCategory = val;
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addShop();
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(200, 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Add'),
                  Icon(Icons.add),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
