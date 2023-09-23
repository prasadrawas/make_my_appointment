import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/constants/string_constants.dart';
import 'package:dr_appointment/model/doctor/doctor_response.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsWithIcons extends StatelessWidget {
  final DoctorResponse doctor;
  const DoctorDetailsWithIcons({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _DetailCard(
          iconData: FontAwesomeIcons.person,
          title: '${doctor.patientsServed}+',
          subTitle: StringConstants.patients,
        ),
        _DetailCard(
          iconData: Icons.work_rounded,
          title: '${doctor.yearsOfExperience}+',
          subTitle: StringConstants.yearOfExp,
        ),
        _DetailCard(
          iconData: FontAwesomeIcons.solidStar,
          title: '${doctor.rating}+',
          subTitle: StringConstants.rating,
        ),
        _DetailCard(
          iconData: FontAwesomeIcons.solidMessage,
          title: doctor.numberOfReviews.toString(),
          subTitle: StringConstants.review,
        ),
      ],
    );
  }
}

class _DetailCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subTitle;
  const _DetailCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColorOff,
          ),
          child: Center(
            child: Icon(
              iconData,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyles.semiBold(
            color: AppColors.primaryColor,
            fontSize: 18,
          ),
        ),
        Text(subTitle,
            style: AppTextStyles.light(color: Colors.black87, fontSize: 12)),
      ],
    );
  }
}
