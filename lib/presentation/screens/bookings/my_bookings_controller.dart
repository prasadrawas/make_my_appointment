import 'package:dr_appointment/data/network/repository/doctor_repository.dart';
import 'package:dr_appointment/model/appointment/appointment_response.dart';
import 'package:get/get.dart';

class MyBookingsController extends GetxController {
  final _repository = DoctorRepository();

  final bookings = <AppointmentResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  void fetchBookings() async {
    final result = await _repository.fetchBookings();
    if (result.isSuccess) {
      bookings.assignAll(result.data!);
    } else {
      Get.snackbar('Error', result.error!);
    }
  }
}
