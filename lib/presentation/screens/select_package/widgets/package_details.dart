import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';

class PackageDetails extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final int groupValue, selectedValue;
  final ValueChanged<int> onChanged;

  const PackageDetails({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.groupValue,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(widget.selectedValue);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.greyColor, width: 0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColorOff,
                      ),
                      child: Center(
                        child: Icon(
                          widget.iconData,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppTextStyles.bold(),
                        ),
                        Text(
                          widget.subtitle,
                          style: AppTextStyles.light(),
                        ),
                      ],
                    ),
                  ],
                ),
                Radio<int>(
                  value: widget.selectedValue,
                  groupValue: widget.groupValue,
                  activeColor: AppColors.primaryColor,
                  onChanged: (int? value) {
                    widget.onChanged(value ?? -1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
