import 'package:get/get.dart';
import 'package:hasanah/src/modules/login/view.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(LoginPage());
    });
    super.onInit();
  }
}
