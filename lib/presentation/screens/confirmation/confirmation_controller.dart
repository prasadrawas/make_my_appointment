import 'package:dr_appointment/data/network/repository/doctor_repository.dart';
import 'package:dr_appointment/model/appointment/appointment_response.dart';
import 'package:get/get.dart';

class ConfirmationController extends GetxController {
  final _repository = DoctorRepository();

  RxBool isLoading = false.obs;

  AppointmentResponse? _appointment;
  AppointmentResponse? get appointment => _appointment;

  @override
  void onInit() {
    super.onInit();
    fetchConfirmationDetails();
  }

  void fetchConfirmationDetails() async {
    isLoading.value = true;
    final result = await _repository.fetchBookingConfirmationDetails();
    isLoading.value = false;
    if (result.isSuccess) {
      _appointment = result.data;
    } else {
      Get.snackbar('Error', result.error!);
    }
  }
}
