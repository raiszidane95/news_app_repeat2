import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../modules/detail_article/models/detail_article_model.dart';
import '../modules/home/models/news_model.dart';

final _connect = Get.find<GetConnect>();

class NewsService {
  Future<List<News>> getAllNews() async {
    final response = await _connect.get('posts',
        decoder: (data) => List<News>.from(data.map((x) => News.fromJson(x))));
    // Logger().d(response.body);
    if (!response.hasError) {
      return response.body!;
    } else {
      throw Get.snackbar("Service Error", response.statusCode.toString());
    }
  }

  Future getDetailNews({required String id}) async {
    final response = await _connect.get('posts/$id', decoder: (data) => Detailnews.fromJson(data));
    print(response.body);
    if (!response.hasError) {
      return response.body!;
    } else {
      Get.snackbar("Service Error", response.statusCode.toString());
      Logger().d(response.statusCode.toString());
    }
  }
}
