import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotDoctorTextField extends StatefulWidget {
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
  State<SpotDoctorTextField> createState() => _SpotDoctorTextFieldState();
}

class _SpotDoctorTextFieldState extends State<SpotDoctorTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        autofocus: false,
        obscureText: widget.isPassword && _obscureText,
        controller: widget.textEditingController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: widget.hint,
          border: InputBorder.none,
          icon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
