import 'package:dr_appointment/common/navigation_serivce.dart';
import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/constants/string_constants.dart';
import 'package:dr_appointment/presentation/screens/bookings/View_bookings.dart';
import 'package:dr_appointment/presentation/screens/confirmation/confirmation_controller.dart';
import 'package:dr_appointment/presentation/screens/doctor/Doctor_details.dart';
import 'package:dr_appointment/presentation/widgets/appbar/primary_appbar.dart';
import 'package:dr_appointment/presentation/widgets/button/primary_button.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/appointment_date_time.dart';

class BookingConfirmationScreen extends StatelessWidget {
  BookingConfirmationScreen({super.key});

  final _ = Get.put(ConfirmationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppbar(
          title: StringConstants.confirmation, centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Obx(() {
              if (_.isLoading.value) {
                return Utils.loading();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 120,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(StringConstants.appointmentConfirmed,
                      style: AppTextStyles.semiBold(fontSize: 22)),
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.light(
                          fontSize: 13, color: Colors.black87),
                      children: [
                        const TextSpan(
                          text:
                              '${StringConstants.youHaveSuccessfullyBookedAppointmentWith} ',
                        ),
                        TextSpan(
                          text: _.appointment?.doctorName ?? 'na',
                          style: AppTextStyles.semiBold(
                            fontSize: 13,
                          ), // Apply bold style here
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppointmentDateTime(
                    doctorName: _.appointment?.doctorName ?? 'na',
                    dateTime: _.appointment?.appointmentDate,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
      persistentFooterButtons: [
        Obx(() {
          if (_.isLoading.value) {
            return const Center();
          }
          return Column(
            children: [
              PrimaryButton(
                text: StringConstants.viewAppointments,
                onPressed: () {
                  Get.to(
                    () => const ViewBookingsScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 300),
                  );
                },
                paddingHorizontal: 12,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  NavigationService.navigateToReplacement(
                    DoctorDetailsScreen(),
                  );
                },
                child: Text(
                  StringConstants.bookAnother,
                  style: AppTextStyles.semiBold(),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
