import 'package:dr_appointment/common/navigation_serivce.dart';
import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/constants/string_constants.dart';
import 'package:dr_appointment/presentation/screens/confirmation/Booking_confirmation.dart';
import 'package:dr_appointment/presentation/screens/doctor/Doctor_details.dart';
import 'package:dr_appointment/presentation/screens/review/review_booking_controller.dart';
import 'package:dr_appointment/presentation/screens/review/widgets/summary_details.dart';
import 'package:dr_appointment/presentation/widgets/appbar/primary_appbar.dart';
import 'package:dr_appointment/presentation/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/doctor_details.dart';

class ReviewBookingScreen extends StatelessWidget {
  ReviewBookingScreen({super.key});

  final _ = Get.put(ReviewBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppbar(
        title: StringConstants.reviewSummary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_.isLoading.value && _.doctor == null && _.appointment == null) {
            return Utils.loading();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Doctor Details Card
              DoctorDetails(doctor: _.doctor!),

              const SizedBox(height: 28),

              // Summary Information
              SummaryReviewDetails(
                text: StringConstants.dateAndHour,
                value: Utils.formatDateTime(
                  _.appointment!.appointmentDate,
                ),
              ),
              SummaryReviewDetails(
                text: StringConstants.package,
                value: _.appointment!.appointmentPackage ?? 'na',
              ),
              const SummaryReviewDetails(
                text: StringConstants.duration,
                value: '30 min',
              ),
              const SummaryReviewDetails(
                text: StringConstants.bookingFor,
                value: 'Self',
              ),
            ],
          );
        }),
      ),
      persistentFooterButtons: [
        Obx(() {
          if (_.isLoading.value) {
            return const Center();
          }
          return Row(
            children: [
              Flexible(
                child: PrimaryButton(
                  text: StringConstants.edit,
                  bgColor: AppColors.primaryColorOff,
                  textColor: AppColors.primaryColor,
                  onPressed: () {
                    Get.offAll(
                      () => DoctorDetailsScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  paddingVertical: 6,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: PrimaryButton(
                  text: StringConstants.confirm,
                  onPressed: () {
                    NavigationService.navigateTo(BookingConfirmationScreen());
                  },
                  paddingVertical: 6,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
