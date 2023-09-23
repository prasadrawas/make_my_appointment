import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';

class SummaryReviewDetails extends StatelessWidget {
  final String text, value;

  const SummaryReviewDetails(
      {Key? key, required this.text, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyles.regular(fontSize: 14),
          ),
          Text(
            value,
            style: AppTextStyles.semiBold(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
