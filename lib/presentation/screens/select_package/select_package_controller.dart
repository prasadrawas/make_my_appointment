import 'package:dr_appointment/data/network/repository/doctor_repository.dart';
import 'package:dr_appointment/model/package/package_response.dart';
import 'package:get/get.dart';

class SelectPackageController extends GetxController {
  final _repository = DoctorRepository();

  RxBool isLoading = false.obs;

  PackageResult? _package;
  PackageResult? get package => _package;

  RxInt selectedPackage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAppointmentOption();
  }

  void fetchAppointmentOption() async {
    isLoading.value = true;
    final result = await _repository.fetchAppointmentOption();
    isLoading.value = false;
    if (result.isSuccess) {
      _package = result.data;
    } else {
      Get.snackbar('Error', result.error!);
    }
  }

  // void selectPackage(int i) {
  //   selectedPackage.value = i;
  //   update();
  // }
}
