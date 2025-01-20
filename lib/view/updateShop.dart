// import 'dart:ffi' as ffi;

// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:makemeover/view/home.dart';
import 'package:makemeover/view/popUp.dart';

class Updateshop extends StatefulWidget {
  final String name;
  final String phone;
  final String category;
  final String id;
  const Updateshop({
    super.key,
    required this.name,
    required this.phone,
    required this.category,
    required this.id,
  });

  @override
  State<Updateshop> createState() => _UpdateshopState();
}

class _UpdateshopState extends State<Updateshop> {
  // String? docId;
  final category = ['Haircut', 'Facial', 'Menicure', 'Pedicure'];
  final CollectionReference shop =
      FirebaseFirestore.instance.collection('shop');

  // Future<void> pickAndUploadImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image == null) return;

  //   File file = File(image.path);
  //   String fileName = image.name;

  //   try {
  //     await FirebaseStorage.instance.ref('uploads/$fileName').putFile(file);
  //     String downloadURL = await FirebaseStorage.instance
  //         .ref('uploads/$fileName')
  //         .getDownloadURL();
  //     setState(() {
  //       imageUrl = downloadURL;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  late TextEditingController shopname;
  // TextEditingController shopname = TextEditingController();

  late TextEditingController phoneNum;
  String? imageUrl;
  late String selectedCategory;

  void updateshop(String docId, context) {
    final data = {
      'Name': shopname.text,
      'phone': phoneNum.text,
      'category': selectedCategory,
    };
    print('Updating document with ID: $docId');
    print('Data: $data');
    try {
      shop.doc(docId).update(data);
    } catch (e) {
      print('errorr $e');
    }

    // // ignore: avoid_print
    // .then((value) => print('object'))
    // // ignore: avoid_print
    // .catchError((e) => print("Error updating document $e"));
    showPopup(
      ctx: context,
      tiltle: 'Updated',
      subtilte: 'Shop detials has been updated successfully',
      confirmTitle2: 'Done',
      onPressed2: () {
        Navigator.pushReplacementNamed(context, '/');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category;
  }

  String? docId;
  // late var args;

  @override
  Widget build(BuildContext context) {
    phoneNum = TextEditingController(text: widget.phone);
    shopname = TextEditingController(text: widget.name);
    // args = ModalRoute.of(context)!.settings.arguments as Map?;
    // docId = shop['id'] ?? '';
    // if (args != null) {
    //   shopname.text = args['Name'] ?? 'a';
    //   phoneNum.text = args['phone'] ?? '';
    //   selectedCategory = args['category'] ?? '';
    //   print('$selectedCategory' + "sdhkf");
    // } else {
    //   shopname.text = '';
    //   phoneNum.text = '';
    //   selectedCategory = null;
    // }
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
                items: category.map<DropdownMenuItem<String>>(
                  (String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  },
                ).toList(),
                onChanged: (String? val) {
                  setState(() {
                    selectedCategory = val ?? '';
                    print('SELECTED $selectedCategory');
                  });
                },
              ),
            ),
            // ElevatedButton(
            //   // ignore: avoid_print
            //   onPressed: () {
            //     // print('args');
            //     // pickAndUploadImage();
            //   },
            //   child: Text('Pick Image'),
            // ),
            ElevatedButton(
              onPressed: () {
                // print(args);
                print('QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ');
                print(selectedCategory);
                updateshop(widget.id, context);
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
