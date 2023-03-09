import 'package:get/get.dart';

import '../../../data/news_service.dart';
import '../models/detail_article_model.dart';

class DetailArticleController extends GetxController {
  RxBool isLoading = false.obs;
  String id = '';
  Rx<Detailnews> detailNews = Detailnews().obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    id = args['id'];
    // Logger().d(args);
    getDetailArticle();
  }

  getDetailArticle() async {
    isLoading(true);
    try {
      final response = await NewsService().getDetailNews(id: id);
      detailNews(response);
    } catch (e) {
      isLoading.toggle();
      Get.snackbar("Error Controller", e.toString());
      print(e.toString());
    }
  }
}
