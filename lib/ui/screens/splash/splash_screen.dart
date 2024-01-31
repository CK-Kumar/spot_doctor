import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spot_doctor/ui/blocs/auth/auth_bloc.dart';
import 'package:spot_doctor/ui/theme/theme.dart';
import 'package:spot_doctor/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(CheckAuthStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            Navigator.pushReplacementNamed(
              context,
              state is AuthSuccess ? AppRoutes.home : AppRoutes.login,
            );
          }
        });
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Spot Doctor'.toUpperCase(),
                  style: displayText,
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: SafeArea(
                    bottom: true,
                    child: LinearProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
