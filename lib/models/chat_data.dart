class ChatData {
  Role role;
  String chatText;

  ChatData(this.role, this.chatText);
}

enum Role { user, bot }
