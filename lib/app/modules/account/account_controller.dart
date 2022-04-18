import 'package:get/get.dart';

class AccountController extends GetxController {
  final selectedPlanId = 0.obs;
  final price = '9.99'.obs;

  @override
  void onReady() {
    super.onReady();

    // TODO 从userProfile 文件中加载
    selectedPlanId.value = 1;
  }
}
