// import 'dart:ffi' as ffi;

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makemeover/view/home.dart';
import 'package:makemeover/view/popUp.dart';

class Addshop extends StatefulWidget {
  const Addshop({super.key});

  @override
  State<Addshop> createState() => _AddshopState();
}

class _AddshopState extends State<Addshop> {
  final category = ['Haircut', 'Facial', 'Menicure', 'Pedicure'];
  final CollectionReference shop =
      FirebaseFirestore.instance.collection('shop');

  addShop(BuildContext context) {
    final name = shopname.text;
    final phone = phoneNum.text;
    if (name.isEmpty || phone.isEmpty) {
      showPopup(
          ctx: context,
          tiltle: 'Error',
          subtilte: 'Please Fill the fields',
          confirmTitle2: 'ok');
    } else {
      final data = {
        'Img': imageUrl,
        'Name': shopname.text,
        'phone': phoneNum.text,
        'category': selectedCategory
      };

      shop.add(data).then((_) {
        showPopup(
          tiltle: 'Shop Added',
          subtilte: 'Shop has been added successfully',
          // ignore: use_build_context_synchronously
          ctx: context,
          confirmTitle1: '',
          confirmTitle2: 'yes',
          onPressed2: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        );
      }).catchError((error) {
        showPopup(
          // ignore: use_build_context_synchronously
          ctx: context,
          tiltle: 'Error',
          subtilte: 'Failed to add shop: $error',
          confirmTitle2: 'OK',
        );
      });
    }
  }

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
              onPressed: pickAndUploadImage,
              child: Text('Pick Image'),
            ),
            divider(boxHeight: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addShop(context);
                });

                // showPopup(
                //   tiltle: 'Shop Added',
                //   subtilte: 'Shop has been added successfully',
                //   context: context,
                //   confirmTitle1: '',
                //   confirmTitle2: 'yes',
                //   onPressed: () {
                //     Navigator.pushReplacementNamed(context, '/');
                //   },
                // );
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
