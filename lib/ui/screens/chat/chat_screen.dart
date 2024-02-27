import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spot_doctor/models/chat_data.dart';
import 'package:spot_doctor/ui/theme/theme.dart';
import 'package:spot_doctor/ui/widgets/app_button_widget.dart';
import 'package:spot_doctor/ui/widgets/app_text_field_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatData> _chatMessages = [];

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
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                final chat = _chatMessages[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
                  child: Align(
                    alignment: chat.role == Role.user
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: chat.role == Role.user
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        chat.chatText,
                        style: TextStyle(
                            color: chat.role == Role.user
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Row(
              children: [
                Expanded(
                  child: SpotDoctorTextField(
                    hint: 'Type your message...',
                    isPassword: false,
                    textEditingController: _textEditingController,
                  ),
                ),
                SizedBox(width: 16.0.w),
                AppButtonWidget(
                  title: 'Send',
                  onPressed: () {
                    final message = _textEditingController.text.trim();
                    if (message.isNotEmpty) {
                      setState(() {
                        _chatMessages.add(ChatData(Role.user, message));
                        // Simulate bot response (you can replace this with actual bot response logic)
                        _chatMessages.add(
                            ChatData(Role.bot, 'Bot response for: $message'));
                        _textEditingController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
