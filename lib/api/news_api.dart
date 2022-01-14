import 'package:flutter_news_app/common/models/news_entity.dart';
import 'package:flutter_news_app/common/utils/http.dart';

/// 新闻 API
class NewsApi {
  /// 获取新闻列表
  ///
  /// 参数:
  /// * [page] 页码, 0 表示第一页
  /// * [size] 每页大小, 默认为 10
  /// * [sort] 排序规则
  static Future<List<NewsEntity>> getNewsList(
      [int page = 0, int size = 10, sort = 'id,desc']) async {
    var response = await dio.get('/news', queryParameters: {
      'page': page,
      'size': size,
    });
    var content = response.data['content'];
    if (content != null && content is List) {
      return content.map((item) {
        return NewsEntity.fromJson(item);
      }).toList();
    }
    return [];
  }

  static Future<NewsEntity?> getRecommendedNews() async {
    var response = await dio.get('/recommended-news');
    if (response.data != null) {
      return NewsEntity.fromJson(response.data);
    }
  }

  /// 获取新闻分类列表
  static Future<List<dynamic>> getCategories() async {
    var response = await dio.get('/categories');
    return response.data ?? [];
  }

  /// 获取新闻频道列表
  static Future<List<dynamic>> getChannels() async {
    var response = await dio.get('/channels');
    return response.data ?? [];
  }

  /// 获取新闻频道列表
  static Future<List<String>> getPopularTags() async {
    var response = await dio.get('/popular-tags');
    // TODO 写一个 Cast<T, I> ? 利用 extension?
    // https://stackoverflow.com/questions/52752032/get-subtype-of-generic-list-in-dart
    if (response.data == null) return [];
    // _safeCast<List<String>>(response.data);
    return (response.data as List).map((e) => e as String).toList();
  }

  static _safeCast<T>(dynamic data) {}
}
