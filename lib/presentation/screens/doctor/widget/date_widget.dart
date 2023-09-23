import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String date;
  final bool selected;
  final Function(String value)? onSelect;
  const DateWidget({
    super.key,
    required this.date,
    this.selected = false,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onSelect != null) {
          onSelect!(date);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: selected ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: selected ? AppColors.primaryColor : Colors.grey,
              width: 0.1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Utils.getDayOfWeek(date),
                style: AppTextStyles.light(
                  fontSize: 12,
                  color: selected ? AppColors.whiteColor : Colors.black87,
                ),
              ),
              Text(
                Utils.formatMonth(date),
                style: AppTextStyles.semiBold(
                  fontSize: 16,
                  color: selected ? AppColors.whiteColor : Colors.black87,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
