import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/rx_ext.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/model/news_entity.dart';
import '../../data/providers/remote/news_api.dart';

class NewsHomeController extends GetxController with StateMixin {
  final categories = [].obs;
  final channels = [].obs;
  final recommendedNews = Rxn<NewsEntity>();
  final newsItems = <NewsEntity>[].obs;
  final selectedCategory = ''.obs;

  final newsList = <NewsEntity>[].obs.withStatus();

  @override
  void onReady() async {
    super.onReady();

    debugPrint('NewsController: onReady');

    NewsApi.getCategories().then((value) => categories.value = value);
    NewsApi.getChannels().then((value) => channels.value = value);

    newsList.loading();
    NewsApi.getNewsList().then((value) {
      newsList.change(value, RxStatus.success());
    }, onError: (_) {
      newsList.change(null, RxStatus.error('Failed to load news.'));
    });

    // NewsApi.getNewsList().then((value) {
    //   newsItems.value = value;
    //   newsStatus(RxStatus.success());
    // }, onError: (_) {
    //   newsStatus(RxStatus.error('Failed to load news.'));
    // });

    // // 加载分类列表
    // categories.value = await NewsApi.getCategories();
    // // 加载频道列表
    // channels.value = await NewsApi.getChannels();
    // // 加载新闻列表
    // newsItems.value = await NewsApi.getNewsList();

    // change(null, status: RxStatus.loading());
    // NewsApi.getNewsList().then((value) {
    //   change(value, status: RxStatus.success());
    // }, onError: (_) {
    //   change(null, status: RxStatus.error('获取新闻失败'));
    // });

    recommendedNews.value = await NewsApi.getRecommendedNews();
  }
}
