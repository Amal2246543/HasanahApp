import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasanah/src/images.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../colors.dart';
import '../../utilities/custom_widget/custom_text.dart';
import 'logic.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:hasanah/src/modules/home/view.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);

  final logic = Get.put(OtpLogic());
  final StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

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
              const CustomText(
                'ﻛﻮد اﻟﺘﻔﻌﻴﻞ',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomText(
                'سجل دخولك من خلال رقم الجوال',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
              const SizedBox(
                height: 32,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  animationType: AnimationType.fade,
                  autoDisposeControllers: false,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(15),
                    borderWidth: 1,
                    fieldHeight: 60,
                    fieldWidth: 60,
                    errorBorderColor: errorColor,
                    activeColor: logic.errorText.isNotEmpty ? errorColor : primaryColor,
                    activeFillColor: logic.errorText.isNotEmpty
                        ? errorColor.withOpacity(0.3)
                        : primaryColor,
                    selectedColor: borderColor,
                    selectedFillColor: borderColor,
                    inactiveColor: borderColor,
                    inactiveFillColor: borderColor,
                  ),
                  textStyle: const TextStyle(color: primaryColor),
                  animationDuration: const Duration(milliseconds: 300),
                  keyboardType: TextInputType.number,
                  errorAnimationController: errorController,
                  controller: logic.otpController,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    logic.errorText = "";
                    logic.update();
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<OtpLogic>(
                  id: 'counter',
                  builder: (logic) {
                    return logic.counter == 0
                        ? const SizedBox()
                        : CustomText(
                            '0:${logic.counter}',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          );
                  }),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  if (logic.counter == 0) {
                    logic.startCounter();
                  }
                },
                child: const CustomText(
                  'إﻋﺎدة إرﺳﺎل ﻛﻮد اﻟﺘﻔﻌﻴﻞ',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () {

                    if (logic.otpController.text != '1300') {
                      errorController.add(ErrorAnimationType.shake);
                    } else {
                      Get.offAll(HomePage());
                    }
                  },
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
