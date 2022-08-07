import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/utils/chat/chat_class.dart';
import 'package:new_client_app/utils/chat/database_chat.dart';

class ChatPage extends StatefulWidget {
  final String id;
  const ChatPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();
  String message = '';
  final ScrollController _scrollController = ScrollController();
  void scrollTo() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('Chat'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<ChatMessage>>(
                stream: DatabaseChat().readChatMessages(widget.id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No Messages'),
                    );
                  } else if (snapshot.data!.length >= 0) {
                    return ListView.separated(
                      reverse: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 5.0,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final message = snapshot.data![index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: message.sender == widget.id
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: message.sender == widget.id
                                            ? const Color.fromRGBO(
                                                253, 69, 77, 1)
                                            : Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            message.messageText,
                                            style: TextStyle(
                                                color:
                                                    message.sender == widget.id
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: message.sender == widget.id
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  Text(
                                    dateFormat(message.timeMessage),
                                    // DateFormat('ddMMMM HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(message.timeMessage)),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No Messages'),
                    );
                  }
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _messageController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Type your message',
                        floatingLabelStyle: const TextStyle(
                          color: Color.fromRGBO(15, 48, 65, 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(15, 48, 65, 1),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: message.trim().isEmpty ? null : sendMessage,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(250, 169, 22, 1),
                      ),
                      child: const Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }

  String dateFormat(date) {
    final String time =
        DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(date));
    final dayMessage = DateTime.utc(
        (DateTime.fromMicrosecondsSinceEpoch(date)).toUtc().year,
        (DateTime.fromMicrosecondsSinceEpoch(date)).toUtc().month,
        (DateTime.fromMicrosecondsSinceEpoch(date)).toUtc().day);
    final today = DateTime.utc(DateTime.now().toUtc().year,
        DateTime.now().toUtc().month, DateTime.now().toUtc().day);

    if (dayMessage.difference(today).inDays == 0) {
      return 'Today' + ' ' + time;
    } else if (dayMessage.difference(today).inDays == -1) {
      return 'Yesterday' + ' ' + time;
    } else {
      return DateFormat('dd MMMM HH:mm')
          .format(DateTime.fromMicrosecondsSinceEpoch(date));
    }
  }

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    await DatabaseChat().startChat(widget.id, 'rVu8FOvKC3aoBcOiq4FKinZY42p1',
        _messageController.text.trim());
    _messageController.clear();
  }
}
