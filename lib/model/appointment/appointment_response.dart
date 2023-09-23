class AppointmentResponse {
  String? bookingId;
  String doctorName;
  String location;
  DateTime appointmentDate;
  String appointmentTime;
  String? appointmentPackage;

  AppointmentResponse({
    this.bookingId,
    required this.doctorName,
    required this.location,
    required this.appointmentDate,
    required this.appointmentTime,
    this.appointmentPackage,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      AppointmentResponse(
        bookingId: json["booking_id"],
        doctorName: json["doctor_name"],
        location: json["location"],
        appointmentDate: DateTime.parse(json["appointment_date"]),
        appointmentTime: json["appointment_time"],
        appointmentPackage: json["appointment_package"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "doctor_name": doctorName,
        "location": location,
        "appointment_date":
            "${appointmentDate.year.toString().padLeft(4, '0')}-${appointmentDate.month.toString().padLeft(2, '0')}-${appointmentDate.day.toString().padLeft(2, '0')}",
        "appointment_time": appointmentTime,
        "appointment_package": appointmentPackage,
      };
}
