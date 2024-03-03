import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? data;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText(this.data,
      {this.fontSize, this.fontWeight, this.color = Colors.black, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Almarai'),
    );
  }
}
