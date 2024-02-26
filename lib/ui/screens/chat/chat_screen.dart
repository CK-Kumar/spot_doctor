import 'package:flutter/material.dart';
import 'package:spot_doctor/ui/theme/theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Chat'.toUpperCase(),
          style: titleTextStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 2,
        centerTitle: true,
      ),
    );
  }
}
