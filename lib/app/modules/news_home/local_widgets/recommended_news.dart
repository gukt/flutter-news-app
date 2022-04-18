return GetX<NewsHomeController>(
    builder: (controller) {
      if (controller.recommendedNews.value == null) {
        return const Text('No recommended news');
      }
      return CustomNewsItem(controller.recommendedNews.value!, style: 1);
    },
  );