import 'package:flutter_news_app/pages/news_v2/binding.dart';
import 'package:get/instance_manager.dart';

import 'account/binding.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsBinding());
    Get.lazyPut(() => AccountBinding());
  }
}
