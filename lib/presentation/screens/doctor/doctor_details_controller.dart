import 'package:dr_appointment/data/network/repository/doctor_repository.dart';
import 'package:dr_appointment/model/doctor/doctor_response.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  final _repository = DoctorRepository();

  RxBool isLoading = false.obs;

  RxString selectedDay = ''.obs;
  RxString selectedTime = ''.obs;

  DoctorResponse? _doctor;
  DoctorResponse? get doctor => _doctor;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    isLoading.value = true;
    final result = await _repository.fetchDoctors();
    if (result.isSuccess) {
      _doctor = result.data!.last;
      final keys = _doctor!.availability.keys.toList();
      selectedDay.value = keys[0];
    } else {
      Get.snackbar('Error', result.error!);
    }
    isLoading.value = false;
  }

  void selectDay(String day) {
    selectedDay.value = day;
    // update();
  }

  void selectTime(String time) {
    selectedTime.value = time;
    // update();
  }
}
