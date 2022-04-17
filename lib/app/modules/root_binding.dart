import 'package:flutter_news_app/app/modules/home/home_binding.dart';
import 'package:get/instance_manager.dart';

import 'account/account_binding.dart';
import 'news_home/news_home_binding.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeBinding());
    Get.lazyPut(() => NewsHomeBinding());
    Get.lazyPut(() => AccountBinding());
  }
}
