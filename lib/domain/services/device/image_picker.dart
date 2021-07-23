import 'dart:io';

import 'package:image_picker/image_picker.dart';

/// Device service used to select images from a galler, or take a photo from
/// the camera.
class ImagePickerService {
  /// ImagePickerService constructor
  ImagePickerService({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  final ImagePicker _imagePicker;

  /// Obtain an image from the phone's gallery using the [ImagePicker] service.
  Future<File?> getImageFromGallery() async {
    final image = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    final imagePath = await image?.path;
    if (imagePath != null) {
      return File(imagePath);
    }
  }
}
