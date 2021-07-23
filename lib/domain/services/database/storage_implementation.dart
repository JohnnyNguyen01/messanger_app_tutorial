import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../models/values/failure.dart';
import 'storage_repository.dart';

/// Storage Repository Implementation
class StorageRepositoryImplementation implements StorageRepository {
  final _storageInstance = firebase_storage.FirebaseStorage.instance;

  @override
  Future<String?> uploadImage(File? file, String? uid) async {
    try {
      if (file != null) {
        final snapshot = await _storageInstance.ref(uid).putFile(file);
        return snapshot.ref.getDownloadURL();
      }
    } on firebase_storage.FirebaseException catch (e) {
      throw Failure(code: e.code, message: e.message);
    }
  }
}
