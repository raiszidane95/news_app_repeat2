// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final int? id;
  HomeView({
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: const Text(
          'News App',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.listNews.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL_ARTICLE,
                    arguments: {'id': controller.listNews[index].id.toString()});
                Logger().d(id);
              },
              child: Container(
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.listNews[index].title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Gap(15),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        controller.listNews[index].body,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.POST_ARTICLE);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ),
    );
  }
}
