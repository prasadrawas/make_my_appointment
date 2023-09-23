import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/string_constants.dart';
import 'package:dr_appointment/presentation/screens/review/widgets/doctor_details.dart';
import 'package:dr_appointment/presentation/screens/select_package/Select_package.dart';
import 'package:dr_appointment/presentation/widgets/appbar/primary_appbar.dart';
import 'package:dr_appointment/presentation/widgets/button/primary_button.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'doctor_details_controller.dart';
import 'widget/date_widget.dart';
import 'widget/doctor_details_icon.dart';
import 'widget/time_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  DoctorDetailsScreen({super.key});

  final _ = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppbar(
        title: StringConstants.reviewSummary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<DoctorController>(
            init: _,
            builder: (__) {
              return Obx(() {
                if (_.isLoading.value) {
                  return Utils.loading();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DoctorDetails(
                      doctor: _.doctor!,
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 0.6),
                    const SizedBox(height: 10),
                    DoctorDetailsWithIcons(doctor: _.doctor!),
                    const SizedBox(height: 25),
                    Text(
                      StringConstants.bookAnother,
                      style:
                          AppTextStyles.light(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(height: 25),
                    getDayListView(),
                    const SizedBox(height: 25),
                    getTimeListView(),
                  ],
                );
              });
            }),
      ),
      persistentFooterButtons: [
        Obx(() {
          if (_.isLoading.value) {
            return const Center();
          }
          return PrimaryButton(
            text: StringConstants.confirm,
            onPressed: onPressed(),
            paddingVertical: 10,
          );
        })
      ],
    );
  }

  Column getTimeListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.time,
          style: AppTextStyles.semiBold(color: Colors.black87, fontSize: 18),
        ),
        const SizedBox(height: 15),
        if (_.selectedDay.value.isNotEmpty &&
            _.doctor!.availability[_.selectedDay]!.isEmpty)
          Center(
            child: Text(
              'No time slots available',
              style: AppTextStyles.light(),
            ),
          ),
        if (_.selectedDay.value.isNotEmpty &&
            _.doctor!.availability[_.selectedDay]!.isNotEmpty)
          SizedBox(
            height: 48,
            child: ListView.builder(
              key: UniqueKey(), // Add a unique key here
              itemCount: _.doctor!.availability[_.selectedDay]!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (__, i) {
                final value = _.doctor!.availability[_.selectedDay.value]![i];
                return TimeWidget(
                    date: value,
                    selected: _.selectedTime.value == value,
                    onSelect: (String val) {
                      _.selectedTime.value = val;
                      _.update();
                    });
              },
            ),
          )
      ],
    );
  }

  Column getDayListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.day,
          style: AppTextStyles.semiBold(color: Colors.black87, fontSize: 18),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 48,
          child: ListView.builder(
            key: UniqueKey(), // Add a unique key here
            itemCount: _.doctor!.availability.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (__, i) {
              final keys = _.doctor!.availability.keys.toList();
              return DateWidget(
                date: keys[i],
                selected: _.selectedDay.value == keys[i],
                onSelect: (String day) {
                  _.selectedDay.value = day;
                  _.selectedTime.value = '';
                },
              );
            },
          ),
        )
      ],
    );
  }

  void Function()? onPressed() {
    return _.selectedDay.value.isNotEmpty && _.selectedTime.value.isNotEmpty
        ? () => Get.to(
              () => const SelectPackageScreen(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 300),
            )
        : null;
  }
}
