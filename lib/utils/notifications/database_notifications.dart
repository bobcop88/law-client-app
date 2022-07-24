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
}
