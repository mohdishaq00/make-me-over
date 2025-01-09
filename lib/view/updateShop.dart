// import 'dart:ffi' as ffi;

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makemeover/view/home.dart';

class Updateshop extends StatefulWidget {
  const Updateshop({super.key});

  @override
  State<Updateshop> createState() => _AddshopState();
}

class _AddshopState extends State<Updateshop> {
  // String? docId;
  final category = ['Haircut', 'Facial', 'Menicure', 'Pedicure'];
  final CollectionReference shop =
      FirebaseFirestore.instance.collection('shop');

  Future<void> pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    File file = File(image.path);
    String fileName = image.name;

    try {
      await FirebaseStorage.instance.ref('uploads/$fileName').putFile(file);
      String downloadURL = await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .getDownloadURL();
      setState(() {
        imageUrl = downloadURL;
      });
    } catch (e) {
      print(e);
    }
  }

  TextEditingController shopname = TextEditingController();
  TextEditingController phoneNum = TextEditingController();
  String? imageUrl;
  String? selectedCategory;

  void updateshop(docId) {
    final data = {
      'Name': shopname.text,
      'category': selectedCategory,
    };
    shop.doc(docId).update(data);
    print('aseem======================================================');
  }

  // get docId => null;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final String docId = args?['docId'];
    if (args != null) {
      shopname.text = args['Name'];
      selectedCategory = args['category'];
    } else {
      shopname.text = '';
      selectedCategory = null;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 216, 216),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(160, 228, 198, 188),
        title: Text('Edit your shop Details'),
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
                color: const Color.fromARGB(71, 120, 120, 120),
              ),
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
                    controller: shopname,
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
                    controller: phoneNum,
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
                value: selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
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
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  {
                    selectedCategory = val;
                  }
                },
              ),
            ),
            ElevatedButton(
              // ignore: avoid_print
              onPressed: () {
                // print('args');
                // pickAndUploadImage();
              },
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: () {
                updateshop(docId);
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
                  Text('Update'),
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
