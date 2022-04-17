import 'package:flutter_news_app/app/modules/news_home/news_home_controller.dart';
import 'package:get/instance_manager.dart';

class NewsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsHomeController());
  }
}
