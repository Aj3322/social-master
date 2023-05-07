import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(
      String directoryName, Uint8List file, bool ispost) async {
    try {
      // Create a reference to the file location in Firebase Storage
      Reference ref = _storage
          .ref()
          .child(directoryName)
          .child(_auth.currentUser!.uid)
          .child(DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");

      // Upload the file to Firebase Storage
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL of the uploaded file
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Return the download URL
      return downloadUrl;
    } catch (e) {
      // Handle any exceptions here
      print(e.toString());
      throw Exception('Failed to upload image');
    }
  }
}
