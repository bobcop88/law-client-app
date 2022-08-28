import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/pages/app_pages/services/services_pending/pending_service_page.dart';
import 'package:new_client_app/utils/notifications/database_notifications.dart';
import 'package:new_client_app/utils/notifications/notification_class.dart';

class EndDrawerNotifications extends StatefulWidget {
  final String id;
  const EndDrawerNotifications({Key? key, required this.id}) : super(key: key);

  @override
  State<EndDrawerNotifications> createState() => _EndDrawerNotificationsState();
}

class _EndDrawerNotificationsState extends State<EndDrawerNotifications> {
  bool notificationVisible = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder<List<NotificationAdminDetails>>(
        stream: DatabaseNotifications().readNotifications(widget.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.data!.isEmpty) {
            return Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 50.0,
                          ),
                          Icon(
                            Icons.notifications_off,
                            color: Color.fromRGBO(250, 169, 22, 1),
                            size: 40,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'No Notifications Available',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            final notification = snapshot.data!;
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Notifications',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 10.0,
                // ),
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
    return Visibility(
      visible: notificationVisible,
      child: Card(
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
                    style: const TextStyle(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text('Update for '),
                        GestureDetector(
                          child: Text(
                            notification.notificationType,
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ServicePendingPage(
                                    serviceName: notification.notificationType,
                                    userId: widget.id)));
                          },
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      DatabaseNotifications().deleteNotification(
                          widget.id, notification.notificationDate.toString());
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete,
                          size: 14.0,
                          color: Color.fromRGBO(250, 169, 22, 1),
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromRGBO(250, 169, 22, 1)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
