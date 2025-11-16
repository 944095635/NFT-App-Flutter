import 'package:get/get.dart';
import 'package:nft/pages/home/home_page.dart';

class StartLogic extends GetxController {
  var open = false.obs;

  void toHome() {
    Get.offAll(() => const HomePage());
  }
}
