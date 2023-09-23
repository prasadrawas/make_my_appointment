import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/constants/string_constants.dart';
import 'package:dr_appointment/model/appointment/appointment_response.dart';
import 'package:dr_appointment/presentation/screens/doctor/Doctor_details.dart';
import 'package:dr_appointment/presentation/widgets/button/primary_button.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BookingInfoCard extends StatelessWidget {
  final AppointmentResponse booking;
  final double paddingHorizontal, paddingVertical;

  const BookingInfoCard({
    Key? key,
    required this.booking,
    this.paddingVertical = 0,
    this.paddingHorizontal = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
      child: Container(
        // elevation: 1.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.2),
          borderRadius: BorderRadius.circular(15),
        ),

        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Utils.formatDateTime(booking.appointmentDate),
                style: AppTextStyles.semiBold(),
              ),
              const SizedBox(height: 8.0),

              // Divider
              const Divider(thickness: 0.7),

              const SizedBox(height: 8.0),

              // Doctor's Info
              Row(
                children: [
                  // Doctor Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images.pexels.com/photos/5327585/pexels-photo-5327585.jpeg?auto=compress&cs=tinysrgb&w=1600',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                      // placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(width: 16.0),

                  // Doctor Name, Location, Booking ID
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.doctorName,
                          style: AppTextStyles.semiBold(fontSize: 16),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 12,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(width: 6.0),
                            Text(
                              booking.location,
                              style: AppTextStyles.light(
                                color: Colors.black87,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.ticket,
                              size: 12,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(width: 6.0),
                            RichText(
                              strutStyle: const StrutStyle(fontSize: 13),
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Booking ID: ',
                                    style: AppTextStyles.light(
                                      color: Colors.black87,
                                      fontSize: 11,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '#${booking.bookingId}',
                                    style: AppTextStyles.medium(
                                      color: AppColors.primaryColor,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),

              const Divider(thickness: 0.7),

              const SizedBox(height: 8.0),

              // Cancel and Reschedule Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: PrimaryButton(
                      text: StringConstants.cancel,
                      onPressed: () {},
                      textColor: AppColors.primaryColor,
                      bgColor: AppColors.primaryColorOff,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: PrimaryButton(
                      text: StringConstants.reschedule,
                      onPressed: () {
                        Get.offAll(
                          () => DoctorDetailsScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
