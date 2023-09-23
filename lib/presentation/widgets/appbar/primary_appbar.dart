import 'package:dr_appointment/styles/styles.dart';
import 'package:flutter/material.dart';

class PrimaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onBackPress;
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;

  const PrimaryAppbar({
    super.key,
    this.onBackPress,
    required this.title,
    this.centerTitle = true,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: onBackPress != null
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // color: Colors.grey,
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.7))),
                    child: const Icon(
                      Icons.keyboard_backspace_rounded,
                      size: 18,
                    ),
                  ),
                )
              : null,
          title: Text(
            title,
            style: AppTextStyles.semiBold(),
          ),
          centerTitle: centerTitle,
          actions: actions,
        ),
        const Divider(
          thickness: 0.7,
          height: 1,
        )
      ],
    );
  }
}
