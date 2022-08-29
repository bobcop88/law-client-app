import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_client_app/utils/notifications/notification_class.dart';

class DatabaseNotifications {
  Stream<List<NotificationAdminDetails>> readNotifications(id) {
    return FirebaseFirestore.instance
        .collection('clients/$id/notificationsFromAdmin')
        .orderBy('notificationDate', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotificationAdminDetails.fromJson(doc.data()))
            .toList());
  }

  deleteNotification(String id, String notificationId) {
    return FirebaseFirestore.instance
        .collection('clients/$id/notificationsFromAdmin')
        .doc(notificationId)
        .delete();
  }

  Stream<List<NotificationAdminDetails>> newNotificationsFromAdmin(id) {
    return FirebaseFirestore.instance
        .collection('clients/$id/notificationsFromAdmin')
        .orderBy('notificationDate', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotificationAdminDetails.fromJson(doc.data()))
            .toList());
  }
}

class EmailNotification {
  Future sendEmailServiceRequested(
      String userName, String service, String email) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    await http.post(url,
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          'service_id': 'notifications_inscale',
          'template_id': 'user_notifications_email',
          'user_id': 'tXmRQi1qQBn4qBEm8',
          'template_params': {
            'from_name': 'Inscale Media App',
            'user_name': userName,
            'user_email': email,
            'service_name': service,
            'to_receiver': 'notifications.inscale@gmail.com'
          }
        }));
  }
}

class DatabaseNotificationsUserToAdmin {
  final String adminUser;
  DatabaseNotificationsUserToAdmin({required this.adminUser});

  Future sendNotificationToAdmin(
      String id, String name, String email, String type, String details) async {
    final notificationsUser = FirebaseFirestore.instance
        .collection('adminUsers/$adminUser/notificationsFromUsers');
    final date = DateTime.now().microsecondsSinceEpoch;
    final notificationDoc = notificationsUser.doc(date.toString());

    final notificationToAdmin = NotificationsUserToAdmin(
      userId: id,
      nameUser: name,
      emailUser: email,
      notificationType: type,
      notificationDetails: details,
      dateNotification: date,
      isNew: true,
    );

    final json = notificationToAdmin.toJson();
    await notificationDoc.set(json);
  }
}
