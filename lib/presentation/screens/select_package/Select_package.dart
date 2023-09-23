import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/string_constants.dart';
import 'package:dr_appointment/presentation/screens/review/review_booking.dart';
import 'package:dr_appointment/presentation/widgets/appbar/primary_appbar.dart';
import 'package:dr_appointment/presentation/widgets/button/primary_button.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'select_package_controller.dart';
import 'widgets/package_details.dart';
import 'widgets/package_dropdown.dart';

class SelectPackageScreen extends StatefulWidget {
  const SelectPackageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectPackageScreenState createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {
  final _ = Get.put(SelectPackageController());

  String? selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppbar(title: StringConstants.selectPackage),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<SelectPackageController>(
          init: _,
          builder: (__) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(() {
                if (_.isLoading.value && _.package == null) {
                  return Utils.loading();
                }
                selectedDuration =
                    selectedDuration == null ? _.package!.duration.first : null;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 12.0),
                    // Select Duration Text
                    Text(
                      StringConstants.selectDuration,
                      style: AppTextStyles.semiBold(fontSize: 22),
                    ),

                    const SizedBox(height: 8.0),

                    // Select Duration Dropdown
                    PackageDropdown(
                      prefixIcon: Icons.access_time_filled, // Clock icon
                      items: _.package!.duration,
                      selectedItem: _.package!.duration.first,
                      onChanged: (value) {
                        selectedDuration = value;
                      },
                    ),

                    const SizedBox(height: 40.0),

                    // Select Package Text
                    getSelectPackage()
                  ],
                );
              }),
            );
          },
        ),
      ),
      persistentFooterButtons: [
        Obx(() {
          if (_.isLoading.value) {
            return const Center();
          }
          return PrimaryButton(
            text: StringConstants.next,
            onPressed: () {
              Get.to(
                () => ReviewBookingScreen(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300),
              );
            },
            paddingVertical: 10,
          );
        }),
      ],
    );
  }

  Column getSelectPackage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.selectPackage,
          style: AppTextStyles.semiBold(fontSize: 22),
        ),

        const SizedBox(height: 12.0),

        // Package Details Widget
        ListView.builder(
            itemCount: _.package!.package.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (__, i) {
              return PackageDetails(
                iconData: getPackageIcon(_.package!.package[i]),
                title: _.package!.package[i],
                subtitle: '${_.package!.package[i]} with doctor',
                groupValue: _.selectedPackage.value,
                selectedValue: i,
                onChanged: (value) {
                  _.selectedPackage.value = value;
                  _.update();
                },
              );
            }),
      ],
    );
  }

  IconData getPackageIcon(String package) {
    if (package == 'Messaging') {
      return FontAwesomeIcons.message;
    } else if (package == 'Voice Call') {
      return FontAwesomeIcons.phone;
    } else if (package == 'Video Call') {
      return FontAwesomeIcons.video;
    } else {
      return FontAwesomeIcons.person;
    }
  }
}
