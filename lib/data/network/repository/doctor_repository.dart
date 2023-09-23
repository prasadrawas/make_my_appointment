import 'package:dr_appointment/common/logger_service.dart';
import 'package:dr_appointment/data/network/api/api_client.dart';
import 'package:dr_appointment/model/appointment/appointment_response.dart';
import 'package:dr_appointment/model/doctor/doctor_response.dart';
import 'package:dr_appointment/model/package/package_response.dart';
import 'package:dr_appointment/model/result/result.dart';

class DoctorRepository {
  late ApiClient client;
  DoctorRepository() {
    client = ApiClient(
        baseUrl:
            'https://my-json-server.typicode.com/githubforekam/doctor-appointment');
  }

  Future<Result<List<DoctorResponse>>> fetchDoctors() async {
    try {
      final response = await client.get('/doctors');
      if (response.statusCode == 200) {
        final data = (response.data as List)
            .map((e) => DoctorResponse.fromJson(e))
            .toList();
        return Result(data: data);
      } else {
        LoggerService.e('Failed to fetch doctors: HTTP ${response.statusCode}');
        return Result(error: 'Failed to fetch doctors');
      }
    } catch (e) {
      LoggerService.e('Failed to fetch doctors: $e');
      return Result(error: e.toString());
    }
  }

  Future<Result<PackageResult>> fetchAppointmentOption() async {
    try {
      final response = await client.get('/appointment_options');
      if (response.statusCode == 200) {
        final data = PackageResult.fromJson(response.data);
        return Result(data: data);
      } else {
        LoggerService.e(
            'Failed to fetch appointment options: HTTP ${response.statusCode}');
        return Result(error: 'Failed to fetch appointment options');
      }
    } catch (e) {
      LoggerService.e('Failed to fetch appointment options: $e');
      return Result(error: e.toString());
    }
  }

  Future<Result<AppointmentResponse>> fetchBookingConfirmationDetails() async {
    try {
      final response = await client.get('/booking_confirmation');
      if (response.statusCode == 200) {
        final data = AppointmentResponse.fromJson(response.data);
        return Result(data: data);
      } else {
        LoggerService.e(
            'Failed to fetch booking details: HTTP ${response.statusCode}');
        return Result(error: 'Failed to fetch booking details');
      }
    } catch (e) {
      LoggerService.e('Failed to fetch booking details: $e');
      return Result(error: e.toString());
    }
  }

  Future<Result<List<AppointmentResponse>>> fetchBookings() async {
    try {
      final response = await client.get('/appointments');
      if (response.statusCode == 200) {
        final data = (response.data as List)
            .map((e) => AppointmentResponse.fromJson(e))
            .toList();
        return Result(data: data);
      } else {
        LoggerService.e(
            'Failed to fetch bookings: HTTP ${response.statusCode}');
        return Result(error: 'Failed to fetch bookings');
      }
    } catch (e) {
      LoggerService.e('Failed to fetch bookings: $e');
      return Result(error: e.toString());
    }
  }
}
