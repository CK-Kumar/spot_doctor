import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/ui/theme/theme.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    this.height,
    this.onPressed,
    required this.title,
    super.key,
  });

  final String title;
  final double? height;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SizedBox(
        width: double.infinity,
        height: height ?? 65.h,
        child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF374AE3),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title.tr().toUpperCase(),
            style: titleTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
