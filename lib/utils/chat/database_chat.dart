import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_client_app/utils/chat/chat_class.dart';

class DatabaseChat {
  Future startChat(String userId, String adminId, String messageText) async {
    final CollectionReference chat = FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .collection('messages');

    final chatUser = chat.doc(DateTime.now().millisecondsSinceEpoch.toString());

    final myChat = ChatMessage(
      timeMessage: DateTime.now().microsecondsSinceEpoch,
      sender: userId,
      messageText: messageText,
    );

    final json = myChat.toJson();
    await chatUser.set(json);

    final DocumentReference lastMessage =
        FirebaseFirestore.instance.collection('chats').doc(userId);

    await lastMessage.set({
      'admin': adminId,
      'user': userId,
      'senderLastMessage': userId,
      'textLastMessage': messageText,
      'timeLastMessage': DateTime.now().microsecondsSinceEpoch,
      'isRead': false,
    });
  }

  Stream<List<ChatMessage>> readChatMessages(id) {
    return FirebaseFirestore.instance
        .collection('chats/$id/messages')
        .orderBy('timeMessage', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatMessage.fromJson(doc.data()))
            .toList());
  }

  Stream<List<ChatMessageGeneral>> newChatMessages(id) {
    return FirebaseFirestore.instance
        .collection('chats/$id/messages')
        .where('senderLastMessage', isEqualTo: id)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatMessageGeneral.fromJson(doc.data()))
            .toList());
  }
}
