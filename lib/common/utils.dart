import 'package:dr_appointment/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM d, yyyy - hh:mm a').format(dateTime);
  }

  static String getDayOfWeek(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      String formattedDayOfWeek = DateFormat('E').format(dateTime);
      return formattedDayOfWeek;
    } catch (e) {
      return 'Invalid Date';
    }
  }

  static String formatMonth(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      String formattedDate = DateFormat('d MMM').format(dateTime);
      return formattedDate;
    } catch (e) {
      return 'Invalid Date';
    }
  }

  static Widget loading() {
    return SizedBox(
      height: Get.height * 0.7,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          backgroundColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
