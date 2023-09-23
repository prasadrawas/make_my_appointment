class DoctorResponse {
  String doctorName;
  String image;
  String speciality;
  String location;
  int patientsServed;
  int yearsOfExperience;
  double rating;
  int numberOfReviews;
  Map<String, List<String>> availability;

  DoctorResponse({
    required this.doctorName,
    required this.image,
    required this.speciality,
    required this.location,
    required this.patientsServed,
    required this.yearsOfExperience,
    required this.rating,
    required this.numberOfReviews,
    required this.availability,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) => DoctorResponse(
        doctorName: json["doctor_name"],
        image: json["image"],
        speciality: json["speciality"],
        location: json["location"],
        patientsServed: json["patients_served"],
        yearsOfExperience: json["years_of_experience"],
        rating: json["rating"]?.toDouble(),
        numberOfReviews: json["number_of_reviews"],
        availability: Map.from(json["availability"]).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "doctor_name": doctorName,
        "image": image,
        "speciality": speciality,
        "location": location,
        "patients_served": patientsServed,
        "years_of_experience": yearsOfExperience,
        "rating": rating,
        "number_of_reviews": numberOfReviews,
        "availability": Map.from(availability).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
      };
}
