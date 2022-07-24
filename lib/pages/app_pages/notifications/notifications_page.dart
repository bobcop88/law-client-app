import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/utils/notifications/database_notifications.dart';
import 'package:new_client_app/utils/notifications/notification_class.dart';

class NotificationsPage extends StatefulWidget {
  String id;
  NotificationsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('Notifications'),
      ),
      body: StreamBuilder<List<NotificationAdminDetails>>(
        stream: DatabaseNotifications().readNotifications(widget.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            final notification = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: notification.map(buildNotification).toList(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget buildNotification(NotificationAdminDetails notification) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 8,
                  height: 8,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  dateFormat(notification.notificationDate),
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text('Update for '),
                GestureDetector(
                  child: Text(
                    notification.notificationType,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 14.0,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
}
