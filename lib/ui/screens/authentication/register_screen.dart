import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/ui/theme/theme.dart';
import 'package:spot_doctor/ui/widgets/app_button_widget.dart';
import 'package:spot_doctor/ui/widgets/app_text_field_widget.dart';
import 'package:spot_doctor/utils/constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Spot Doctor'.toUpperCase(),
                                style: displayText,
                              ),
                            ),
                            SizedBox(height: 30.0.h),
                            SpotDoctorTextField(
                                hint: 'user.email'.tr(),
                                isPassword: false,
                                icon: Icons.email),
                            SizedBox(height: 28.0.h),
                            SpotDoctorTextField(
                                hint: 'user.password'.tr(),
                                isPassword: true,
                                icon: Icons.lock),
                            SizedBox(height: 28.0.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.login);
                                  },
                                  child: Text(
                                    'user.have_account'.tr(),
                                    style: linkText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      bottom: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppButtonWidget(
                            title: 'user.register',
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
