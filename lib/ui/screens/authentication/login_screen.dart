import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spot_doctor/common/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'user.start_session'.tr(),
                              ),
                              const SizedBox(height: 28.0),
                              Text(
                                'user.email'.tr(),
                                style: titleTextStyle,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                // No need for a specific style or decoration
                                controller: TextEditingController(),
                              ),
                              const SizedBox(height: 28.0),
                              Text('user.password'.tr()),
                              TextFormField(
                                autofocus: false,
                                obscureText: true,
                                // No need for a specific style or decoration
                                controller: TextEditingController(),
                              ),
                              const SizedBox(height: 54.0),
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
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text(
                                'user.start_session'.tr().toUpperCase(),
                              ),
                            ),
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
      ),
    );
  }
}
