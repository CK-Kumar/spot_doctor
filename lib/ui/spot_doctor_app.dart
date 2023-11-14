import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spot_doctor/common/constants.dart';
import 'package:spot_doctor/common/theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/ui/screens/authentication/login_screen.dart';

class SpotDoctorApp extends StatelessWidget {
  const SpotDoctorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: ScreenUtilInit(
        designSize: const Size(411, 844),
        builder: (BuildContext context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spot Doctor',
          theme: ThemeData(
              useMaterial3: true, colorScheme: Style.lightColorScheme),
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: Style.darkColorScheme),
          initialRoute: AppRoutes.login,
          routes: {
            AppRoutes.login: (context) => const LoginScreen(),
          },
        ),
      ),
    );
  }
}
