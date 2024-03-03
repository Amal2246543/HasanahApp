import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasanah/src/colors.dart';
import 'package:hasanah/src/modules/page_details/view.dart';

import '../../data.dart';
import '../../images.dart';
import '../../utilities/custom_widget/custom_text.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconLogo,
                scale: 7,
              ),
              const SizedBox(
                width: 20,
              ),
              const CustomText(
                'منصة حصانة الاستثمارية',
                fontSize: 16,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: backgroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  buildHomeItem(iconSolution1, title1, des1),
                  buildHomeItem(iconSolution2, title2, des2),
                  buildHomeItem(iconSolution3, title3, des3),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildHomeItem(String icon, String title, String des) {
    return GestureDetector(
      onTap: () => Get.to(PageDetailsPage(
        icon: icon,
        title: title,
        des: des,
      )),
      child: Container(
        decoration:
            BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              icon,
              scale: 4,
            ),
            const SizedBox(width: 16),
            CustomText(
              title,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
