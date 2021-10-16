import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class UploadFile {
  Future<String?> uploadFile(file) async {
    try {
      String fileName = file.path.split('/').last;
      String encoded = base64.encode(utf8.encode(fileName));
      TaskSnapshot snapshot = await firebase_storage.FirebaseStorage.instance
          .ref('uploads/$encoded')
          .putFile(file);
      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        throw ('This file is not an image');
      }
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
}
