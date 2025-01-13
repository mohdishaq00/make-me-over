import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class Imagepicker {
  final ImagePicker picker = ImagePicker();
  Future<String?> uploadImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    File file = File(image.path);
    String fileName = image.name;
    try {
      await FirebaseStorage.instance.ref('Upload/$fileName').putFile(file);
      String downloadUrl = await FirebaseStorage.instance
          .ref('Upload/$fileName')
          .getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
