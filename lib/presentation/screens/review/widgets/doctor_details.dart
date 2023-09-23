import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/model/doctor/doctor_response.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatelessWidget {
  final DoctorResponse doctor;
  final double paddingHorizontal;

  const DoctorDetails({
    Key? key,
    required this.doctor,
    this.paddingHorizontal = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        children: [
          // First Child: Doctor Image with Verified Badge
          Container(
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue, // You can change the border color
                width: 2.0,
              ),
            ),
            child: Stack(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: doctor.image,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.verified,
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Second Child: Doctor Details (Name, Speciality, Location)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.doctorName, style: AppTextStyles.bold()),
                  const SizedBox(height: 4.0),
                  Text(
                    doctor.speciality,
                    style: AppTextStyles.light(),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.primaryColor,
                        size: 20.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(doctor.location),
                      const SizedBox(width: 4.0),
                      const Icon(
                        Icons.map_sharp,
                        color: AppColors.primaryColor,
                        size: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
