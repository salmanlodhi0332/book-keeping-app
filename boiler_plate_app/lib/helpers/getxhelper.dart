import 'dart:io';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class GetxControllersProvider extends GetxController {
  RxString imagePath = ''.obs;
  RxString AddimagePath = ''.obs;
  RxString AddvideoPath = ''.obs;
  
  RxList<String> multipleImagePaths = <String>[].obs;

  var defaultImagePath = 'assets/images/defaultProfile.png';

  Future<void> getImage() async {
    final _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final compressedImage = await compressImage(File(image.path));
      imagePath.value = compressedImage.path;
    } else {
      imagePath.value = '';
    }
  }

  Future<void> getMultipleImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      List<String> compressedPaths = [];

      for (var image in images) {
        final compressedImage = await compressImage(File(image.path));
        compressedPaths.add(compressedImage.path);
      }

      multipleImagePaths.value = compressedPaths;
    } else {
      multipleImagePaths.clear();
    }
  }

   compressImage(File file) async {
    // try {
    //   final dir = await getTemporaryDirectory();

    //   final targetPath = join(
    //     dir.path,
    //     'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
    //   );

    //   final XFile? result = await FlutterImageCompress.compressAndGetFile(
    //     file.absolute.path,
    //     targetPath,
    //     quality: 70,
    //   );

    //   return result != null ? File(result.path) : file;
    // } catch (e) {
    //   print('Image compression failed: $e');
    //   return file;
    // }
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }
}
