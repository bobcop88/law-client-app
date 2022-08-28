import 'package:flutter/material.dart';

class ChatMessage {
  final int timeMessage;
  final String sender;
  final String messageText;

  ChatMessage({
    required this.timeMessage,
    required this.sender,
    required this.messageText,
  });

  Map<String, dynamic> toJson() => {
        'timeMessage': timeMessage,
        'sender': sender,
        'messageText': messageText,
      };

  static ChatMessage fromJson(Map<String, dynamic> json) => ChatMessage(
        timeMessage: json['timeMessage'],
        sender: json['sender'],
        messageText: json['messageText'],
      );
}

class ChatMessageGeneral {
  final String admin;
  final bool isRead;
  final String senderLastMessage;
  final String textLastMessage;
  final String timeLastMessage;
  final String user;

  ChatMessageGeneral(
      {required this.admin,
      required this.isRead,
      required this.senderLastMessage,
      required this.textLastMessage,
      required this.timeLastMessage,
      required this.user});

  static ChatMessageGeneral fromJson(Map<String, dynamic> json) =>
      ChatMessageGeneral(
          admin: json['admin'],
          isRead: json['isRead'],
          senderLastMessage: json['senderLastMessage'],
          textLastMessage: json['textLastMessage'],
          timeLastMessage: json['timeLastMessage'],
          user: json['user']);
}
