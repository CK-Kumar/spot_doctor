import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot_doctor/domain/auth/auth_usecase.dart';
import 'package:spot_doctor/firebase_options.dart';
import 'package:spot_doctor/services/service_locator.dart';
import 'package:spot_doctor/ui/blocs/auth/auth_bloc.dart';
import 'package:spot_doctor/ui/spot_doctor_app.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      useOnlyLangCode: true,
      path: 'assets/i18n',
      fallbackLocale: const Locale('en'),
      child: MultiBlocProvider(providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            locator<AuthUseCase>(),
          ),
        )
      ], child: const SpotDoctorApp()),
    ),
  );
}
