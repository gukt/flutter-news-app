import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/model/news_entity.dart';
import '../../data/providers/remote/news_api.dart';

class NewsHomeController extends GetxController {
  final categories = [].obs;
  final channels = [].obs;
  final recommendedNews = Rxn<NewsEntity>();
  final newsItems = <NewsEntity>[].obs;
  final selectedCategory = ''.obs;

  @override
  void onReady() async {
    debugPrint('NewsController: onReady');

    // 加载分类列表
    categories.value = await NewsApi.getCategories();
    // 加载频道列表
    channels.value = await NewsApi.getChannels();
    // 加载新闻列表
    newsItems.value = await NewsApi.getNewsList();
    recommendedNews.value = await NewsApi.getRecommendedNews();
  }
}
