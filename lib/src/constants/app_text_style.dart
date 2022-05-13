import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle textRegular(double size, Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.normal,
      fontSize: size,
    );
  }

  static TextStyle textSemiBold(double size, Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: size,
    );
  }

  static TextStyle textBold(double size, Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  // static TextStyle blackBold(double size) {
  //   return TextStyle(
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //     fontSize: size,
  //   );
  // }

  // static TextStyle blackSemiBold(double size) {
  //   return TextStyle(
  //     color: Colors.black,
  //     fontWeight: FontWeight.w600,
  //     fontSize: size,
  //   );
  // }

  // static TextStyle whiteBold(double size) {
  //   return TextStyle(
  //     color: Colors.white,
  //     fontWeight: FontWeight.bold,
  //     fontSize: size,
  //   );
  // }

  // static TextStyle greenBold(double size) {
  //   return TextStyle(
  //     color: AppColors.jungleGreen,
  //     fontWeight: FontWeight.bold,
  //     fontSize: size,
  //   );
  // }

  // static TextStyle greenRegular(double size) {
  //   return TextStyle(
  //     color: AppColors.jungleGreen,
  //     fontWeight: FontWeight.normal,
  //     fontSize: size,
  //   );
  // }
}
