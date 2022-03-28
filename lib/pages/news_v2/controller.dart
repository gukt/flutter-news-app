import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news_api.dart';
import 'package:flutter_news_app/common/models/news_entity.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NewsController extends GetxController {
  final categories = RxList.empty();
  final channels = RxList.empty();
  final recommendedNews = Rxn<NewsEntity>();
  final newsItems = RxList<NewsEntity>();
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
