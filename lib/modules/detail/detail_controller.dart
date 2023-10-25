import 'dart:io';

import 'package:cosmo_app/modules/detail/image_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailController extends GetxController {
  final imagePicker = ImagePicker();

  Future<void> uploadAndNavigateToImageScreen() async {
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);

    if (file == null) return;

    final String uniqueFilename =
        DateTime.now().millisecondsSinceEpoch.toString();
    final Reference reference = FirebaseStorage.instance.ref();
    final Reference referenceImg = reference.child('images');
    final Reference referenceImgUpload = referenceImg.child(uniqueFilename);

    try {
      await referenceImgUpload.putFile(File(file.path));
      final imgUrl = await referenceImgUpload.getDownloadURL();
      Get.to(() => ImageScreen(imageUrl: imgUrl));
    } catch (e) {
      print(e);
      // Handle error saat pengunggahan gambar
    }
  }
}
