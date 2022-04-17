import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        // init: MyController(),
        // initState: (_) {},
        builder: (_) {
          return PageView(
            controller: controller.pageController.value,
            onPageChanged: controller.handlePageChanged,
            children: controller.pages,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.handlePageChanged,
        items: controller.navItems,
      ),
    );
  }
}
