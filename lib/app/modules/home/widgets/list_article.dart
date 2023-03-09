import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ListArticle extends StatelessWidget {
  final String title, description, id;
  final int length;
  const ListArticle(
      {super.key,
      required this.id,
      required this.title,
      required this.description,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.DETAIL_ARTICLE, arguments: {'id': id});
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
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Gap(15),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
