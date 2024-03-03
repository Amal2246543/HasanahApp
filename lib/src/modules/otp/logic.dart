import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasanah/src/modules/home/view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpLogic extends GetxController {
  final TextEditingController otpController = TextEditingController();

  String errorText = '';
  int counter  = 60;

  @override
  onInit() {
    startCounter();
    super.onInit();
  }

  void startCounter() async {
    counter = 60;
    while (counter > 0) {
      counter--;
      update(['counter']);
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
