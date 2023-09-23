import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';

class PackageDropdown extends StatefulWidget {
  final IconData prefixIcon;
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String> onChanged;

  const PackageDropdown({
    Key? key,
    required this.prefixIcon,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PackageDropdownState createState() => _PackageDropdownState();
}

class _PackageDropdownState extends State<PackageDropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.prefixIcon,
              color: AppColors.primaryColor,
              size: 27,
            ),
          ),
          Expanded(
            child: DropdownButtonHideUnderline(
              // Hide the underline
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primaryColor,
                ),
                iconSize: 24,
                elevation: 16,
                style: AppTextStyles.regular(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    widget.onChanged(newValue);
                  });
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppTextStyles.regular(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
