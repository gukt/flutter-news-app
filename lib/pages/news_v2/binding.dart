import 'package:flutter_news_app/pages/news_v2/controller.dart';
import 'package:get/instance_manager.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }
}
