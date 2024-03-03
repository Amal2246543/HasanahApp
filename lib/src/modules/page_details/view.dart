import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasanah/src/colors.dart';

import '../../images.dart';
import '../../utilities/custom_widget/custom_text.dart';
import 'logic.dart';

class PageDetailsPage extends StatelessWidget {
  final String title;
  final String des;
  final String icon;

  PageDetailsPage({Key? key, required this.title, required this.des, required this.icon})
      : super(key: key);

  final logic = Get.put(PageDetailsLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
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
                ),
                const Spacer(),
                Image.asset(
                  iconLogo,
                  scale: 8,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: backgroundColor,
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: borderColor)
                ),
                child: CustomText(des,fontSize: 16,),),
            ),
          ),
          
        ],
      ),
    );
  }
}
