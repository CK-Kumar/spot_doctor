import 'package:flutter/material.dart';

class SpotDoctorTextField extends StatelessWidget {
  final bool isPassword;
  final String hint;
  final IconData? icon;
  final TextEditingController textEditingController;

  const SpotDoctorTextField({
    required this.isPassword,
    required this.hint,
    this.icon,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        autofocus: false,
        obscureText: isPassword,
        controller: textEditingController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          icon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
