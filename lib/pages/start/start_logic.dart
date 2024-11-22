import 'package:get/get.dart';
import 'package:nft/pages/home/home_page.dart';

class StartLogic extends GetxController {
  var open = false.obs;

  toHome() {
    Get.offAll(() => const HomePage());
  }
}
