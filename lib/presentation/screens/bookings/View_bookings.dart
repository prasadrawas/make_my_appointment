import 'package:dr_appointment/common/utils.dart';
import 'package:dr_appointment/constants/string_constants.dart';
import 'package:dr_appointment/presentation/screens/bookings/widgets/doctor_card.dart';
import 'package:dr_appointment/presentation/widgets/appbar/primary_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_bookings_controller.dart';

class ViewBookingsScreen extends StatelessWidget {
  const ViewBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppbar(
          title: StringConstants.myBookings, centerTitle: true),
      body: GetBuilder<MyBookingsController>(
        init: MyBookingsController(),
        builder: (_) {
          return Obx(() {
            if (_.bookings.isEmpty) {
              return Utils.loading();
            }
            return ListView.builder(
              itemCount: _.bookings.length,
              itemBuilder: (context, index) {
                final booking = _.bookings[index];
                return BookingInfoCard(
                  booking: booking,
                  paddingVertical: 8,
                  paddingHorizontal: 10,
                );
              },
            );
          });
        },
      ),
    );
  }
}
