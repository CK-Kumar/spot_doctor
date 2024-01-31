import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/ui/blocs/auth/auth_bloc.dart';
import 'package:spot_doctor/ui/theme/theme.dart';
import 'package:spot_doctor/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spot Doctor'.toUpperCase(),
          style: titleTextStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 2,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return UserAccountsDrawerHeader(
                  accountName: Text(state is AuthSuccess
                      ? state.user.email.toString().split('@')[0].toUpperCase()
                      : ''),
                  accountEmail: Text(
                    state is AuthSuccess ? state.user.email.toString() : '',
                  ),
                );
              },
            ),
            const Spacer(),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.exit_to_app),
                  SizedBox(width: 30.w),
                  Text(
                    'Logout',
                    style: menuText,
                  ),
                ],
              ),
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.login,
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Home Screen',
                    style: titleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state is AuthSuccess ? state.user.email.toString() : "",
                    style: titleTextStyle,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
