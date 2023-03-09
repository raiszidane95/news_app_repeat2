import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  const DetailArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
            IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new_rounded)),
        elevation: 0.2,
        title: const Text(
          'Detail Article',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Obx(() => Center(
            child: Container(
              height: Get.height * 0.7,
              width: Get.width * 0.9,
              decoration: BoxDecoration(color: Colors.green.shade200),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(controller.detailNews.value.title ?? 'Data not found',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Gap(15),
                  Text(controller.detailNews.value.body ?? 'Data not found',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
