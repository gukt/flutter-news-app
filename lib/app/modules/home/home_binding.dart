import 'package:get/get.dart';

import '../news_home/news_home_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NewsHomeController());
  }
}
