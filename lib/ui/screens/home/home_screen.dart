import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/ui/blocs/auth/auth_bloc.dart';
import 'package:spot_doctor/ui/theme/theme.dart';
import 'package:spot_doctor/ui/widgets/app_button_widget.dart';
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
                  padding: EdgeInsets.all(8.0.h),
                  child: Text(
                    'Home Screen',
                    style: titleTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: Text(
                    state is AuthSuccess ? state.user.email.toString() : "",
                    style: titleTextStyle,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                  child: Padding(
                    padding: EdgeInsets.only(top: 13.0.h, bottom: 13.0.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.h),
                      child: Card(
                        elevation: 3.0,
                        child: SizedBox(
                          height: 200.h,
                          width: double.infinity,
                          child: Align(
                            alignment: Alignment.center,
                            child: AppButtonWidget(
                              title: 'home.try_chat'.tr(),
                              height: 50.h,
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.chat);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
