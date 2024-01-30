import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spot_doctor/ui/screens/authentication/register_screen.dart';
import 'package:spot_doctor/ui/screens/home/home_screen.dart';
import 'package:spot_doctor/utils/constants.dart';
import 'package:spot_doctor/ui/theme/theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/ui/screens/authentication/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
            useMaterial3: true,
            colorScheme: Style.lightColorScheme,
            textTheme: GoogleFonts.robotoFlexTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: Style.darkColorScheme,
            textTheme: GoogleFonts.robotoFlexTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          initialRoute: AppRoutes.login,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          routes: {
            AppRoutes.login: (context) => LoginScreen(),
            AppRoutes.register: (context) => RegisterScreen(),
            AppRoutes.home: (context) => const HomeScreen()
          },
        ),
      ),
    );
  }
}
