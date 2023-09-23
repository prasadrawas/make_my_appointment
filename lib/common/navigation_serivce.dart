import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationService {
  static void navigateTo(Widget page, {Duration? duration}) {
    Get.to(
      () => page,
      transition: Transition.rightToLeft,
      duration: duration ?? const Duration(milliseconds: 300),
    );
  }

  static void navigateToReplacement(Widget page, {Duration? duration}) {
    Get.offAll(
      () => page,
      transition: Transition.rightToLeft,
      duration: duration ?? const Duration(milliseconds: 300),
    );
  }
}
