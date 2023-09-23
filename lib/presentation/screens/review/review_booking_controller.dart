import 'package:dr_appointment/data/network/repository/doctor_repository.dart';
import 'package:dr_appointment/model/appointment/appointment_response.dart';
import 'package:dr_appointment/model/doctor/doctor_response.dart';
import 'package:get/get.dart';

class ReviewBookingController extends GetxController {
  final _repository = DoctorRepository();

  RxBool isLoading = false.obs;

  DoctorResponse? _doctor;
  DoctorResponse? get doctor => _doctor;

  AppointmentResponse? _appointment;
  AppointmentResponse? get appointment => _appointment;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors().then((value) {
      fetchAppointment();
    });
  }

  Future<void> fetchDoctors() async {
    isLoading.value = true;
    final result = await _repository.fetchDoctors();
    // isLoading.value = false;
    if (result.isSuccess) {
      _doctor = result.data!.last;
    } else {
      Get.snackbar('Error', result.error!);
    }
  }

  void fetchAppointment() async {
    // isLoading.value = true;
    final result = await _repository.fetchBookingConfirmationDetails();
    isLoading.value = false;
    if (result.isSuccess) {
      _appointment = result.data!;
    } else {
      Get.snackbar('Error', result.error!);
    }
  }
}
