import 'package:dr_appointment/constants/color_constants.dart';
import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final bool loading;
  final VoidCallback? onPressed;
  final String text;
  final double paddingHorizontal;
  final double paddingVertical;

  const PrimaryButton({
    super.key,
    this.width,
    this.height = 48.0,
    this.borderRadius,
    this.bgColor,
    this.textStyle,
    this.loading = false,
    this.onPressed,
    this.textColor,
    required this.text,
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      child: SizedBox(
        width: width ?? screenWidth,
        height: height,
        child: ElevatedButton(
          onPressed: loading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? AppColors.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
            ),
          ),
          child: loading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : Text(
                  text,
                  style: textStyle ?? AppTextStyles.semiBold(color: textColor),
                ),
        ),
      ),
    );
  }
}
