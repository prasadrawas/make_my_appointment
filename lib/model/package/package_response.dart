import 'package:flutter/material.dart';

class PackageResult {
  List<String> duration;
  List<String> package;

  PackageResult({
    required this.duration,
    required this.package,
  });

  factory PackageResult.fromJson(Map<String, dynamic> json) => PackageResult(
        duration: List<String>.from(json["duration"].map((x) => x)),
        package: List<String>.from(json["package"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "duration": List<dynamic>.from(duration.map((x) => x)),
        "package": List<dynamic>.from(package.map((x) => x)),
      };
}

class PackageOption {
  final String option;
  final IconData iconData;
  final bool selected;

  PackageOption(
      {required this.option, required this.iconData, required this.selected});
}
