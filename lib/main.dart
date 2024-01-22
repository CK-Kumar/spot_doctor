import 'package:flutter/material.dart';
import 'package:spot_doctor/ui/spot_doctor_app.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      useOnlyLangCode: true,
      path: 'assets/i18n',
      fallbackLocale: const Locale('en'),
      child: const SpotDoctorApp(),
    ),
  );
}
