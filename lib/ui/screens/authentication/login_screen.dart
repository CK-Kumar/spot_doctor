import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextField(
          decoration: InputDecoration(
            hintText: 'User ID',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 16.0),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            // Implement your login logic here
            print('Login button pressed');
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: () {
            // Implement your forgot password logic here
            print(MediaQuery.of(context).size.height.toString());
            print(MediaQuery.of(context).size.width.toString());
          },
          child: const Text('Forgot Password?'),
        ),
      ],
    );
  }
}
