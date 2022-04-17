import 'package:flutter_news_app/app/data/model/news_entity.dart';

import '../../providers/remote/news_api.dart';

class NewsRepository {
  NewsRepository(this.api);

  final NewsApi api;

  // Future<List<NewsEntity>> getTopMovies() => api.getNewsList();

  // getAll() {
  //   return api.getAll();
  // }

  // getId(id) {
  //   return api.getId(id);
  // }

  // delete(id) {
  //   return api.delete(id);
  // }

  // edit(obj) {
  //   return api.edit(obj);
  // }

  // add(obj) {
  //   return api.add(obj);
  // }
}
