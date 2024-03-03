import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hasanah/src/images.dart';

import '../../colors.dart';
import '../../utilities/custom_widget/custom_text.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconLogo,
                scale: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomText(
                'منصة حصانة الاستثمارية',
                fontSize: 16,
              ),
              const SizedBox(
                height: 32,
              ),
              const CustomText(
                'سجل دخولك من خلال رقم الجوال',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  CustomText(
                    'رقم الجوال',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: textDarkColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: borderColor, width: 1)),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
                          inputFormatters: [LengthLimitingTextInputFormatter(9)],
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(16),
                              hintText: '5xxxxxxxx',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: hintColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor, width: 1)),
                    child: Row(
                      children: [
                        const CustomText(
                          '966+',
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          iconKsa,
                          scale: 4,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () => logic.login(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        'تسجيل الدخول',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
