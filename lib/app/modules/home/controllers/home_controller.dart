import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/news_service.dart';
import '../models/news_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<News> listNews = <News>[].obs;

  void onInit() {
    super.onInit();
    getAllArticles();
  }

  getAllArticles() async {
    try {
      final response = await NewsService().getAllNews();
      listNews.value = response;
      Logger().d(listNews.value.length);
      isLoading.toggle();
    } catch (e) {
      isLoading.toggle();
      Get.snackbar('Controller Error', e.toString());
      print(e);
    }
  }
}
