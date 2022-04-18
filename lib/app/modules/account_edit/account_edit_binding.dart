import 'package:get/instance_manager.dart';

import '../account/account_controller.dart';

class AccountEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
