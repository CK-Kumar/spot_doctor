import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/ui/blocs/auth/auth_bloc.dart';
import 'package:spot_doctor/ui/theme/theme.dart';
import 'package:spot_doctor/ui/widgets/app_button_widget.dart';
import 'package:spot_doctor/ui/widgets/app_text_field_widget.dart';
import 'package:spot_doctor/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      },
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('user.register_success'.tr()),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                        icon: Icons.email,
                                        textEditingController: _emailController,
                                      ),
                                      SizedBox(height: 28.0.h),
                                      SpotDoctorTextField(
                                        hint: 'user.password'.tr(),
                                        isPassword: true,
                                        icon: Icons.lock,
                                        textEditingController:
                                            _passwordController,
                                      ),
                                      SizedBox(height: 28.0.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SafeArea(
                                bottom: true,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppButtonWidget(
                                      title: 'user.register',
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        BlocProvider.of<AuthBloc>(context).add(
                                          SignUpEvent(
                                            _emailController.text,
                                            _passwordController.text,
                                          ),
                                        );
                                      },
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
                if (state is AuthLoading)
                  const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
