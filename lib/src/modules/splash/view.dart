import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasanah/src/colors.dart';
import 'package:hasanah/src/images.dart';
import 'package:hasanah/src/utilities/custom_widget/custom_text.dart';

import 'logic.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final logic = Get.put(SplashLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconLogo,
              scale: 4,
            ),
            const SizedBox(height: 20,),
            const CustomText(
              'منصة حصانة الاستثمارية',
              color: Colors.white,
              fontSize: 24,
            )
          ],
        ),
      ),
    );
  }
}
