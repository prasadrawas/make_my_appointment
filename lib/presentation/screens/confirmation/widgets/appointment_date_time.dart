import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppointmentDateTime extends StatelessWidget {
  final String doctorName;
  final DateTime? dateTime;
  const AppointmentDateTime({
    super.key,
    required this.doctorName,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          RowText(
            iconData: FontAwesomeIcons.solidUser,
            text: doctorName,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Flexible(
                child: RowText(
                  iconData: FontAwesomeIcons.solidCalendar,
                  text: dateTime == null
                      ? 'na'
                      : Utils.formatDateTime(dateTime!).split('-').first.trim(),
                ),
              ),
              Flexible(
                child: RowText(
                  iconData: FontAwesomeIcons.solidClock,
                  text: dateTime == null
                      ? 'na'
                      : Utils.formatDateTime(dateTime!).split('-').last.trim(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RowText extends StatelessWidget {
  final IconData iconData;
  final String text;
  const RowText({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: AppTextStyles.medium(fontSize: 15),
        ),
      ],
    );
  }
}
