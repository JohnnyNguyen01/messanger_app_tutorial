import 'dart:io';

/// Storage Repo interface
abstract class StorageRepository {
  /// Uploads an image to the storage database
  ///
  /// Returns the url to the uploaded file
  Future<String?> uploadImage(File? file, String? uid);
}
