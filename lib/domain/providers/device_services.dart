import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../services/device/image_picker.dart';

/// Provide the instance of [ImagePicker]
final imagePickerProvider = Provider<ImagePicker>((ref) => ImagePicker());

/// [ImagePickerService] provider
final imagePickerServiceProvider = Provider<ImagePickerService>((ref) {
  final imagePicker = ref.read(imagePickerProvider);
  return ImagePickerService(imagePicker: imagePicker);
});
