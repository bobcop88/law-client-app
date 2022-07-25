import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_client_app/utils/services/my_service_class.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  Future createMyServices(
      String serviceName, String doc1Url, String doc2Url) async {
    final CollectionReference addMyService = FirebaseFirestore.instance
        .collection('clients')
        .doc(uid)
        .collection('myServices');

    final userMyService = addMyService.doc(serviceName);

    final myService = UserMyServices(
        currentState: 'Started',
        serviceName: serviceName,
        doc1Status: 'Pending',
        doc2Status: 'Pending',
        doc1Url: doc1Url,
        doc2Url: doc2Url,
        creationDate: DateTime.now().microsecondsSinceEpoch,
        emailUser: FirebaseAuth.instance.currentUser!.email.toString(),
        userId: FirebaseAuth.instance.currentUser!.uid);

    final json = myService.toJson();
    await userMyService.set(json);
  }

  Future<bool> checkServiceExists(String serviceNumber) async {
    final docRef = await FirebaseFirestore.instance
        .collection('clients/$uid/myServices')
        .doc(serviceNumber)
        .get();
    return docRef.exists;
  }

  Stream<UserMyServices> readMyService(serviceNumber) {
    return FirebaseFirestore.instance
        .collection('clients/$uid/myServices/')
        .doc(serviceNumber)
        .snapshots()
        .map((snapshot) => UserMyServices.fromJson(snapshot.data()!));
  }

  Stream<List<UserMyServices>> readAllMyServices() {
    return FirebaseFirestore.instance
        .collection('clients/$uid/myServices')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserMyServices.fromJson(doc.data()))
            .toList());
  }

  Stream<List<UserMyServices>> readAllMyServicesPending() {
    return FirebaseFirestore.instance
        .collection('clients/$uid/myServices')
        .where('currentState', isNotEqualTo: 'Completed')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserMyServices.fromJson(doc.data()))
            .toList());
  }

  Stream<List<UserMyServices>> readAllMyServicesCompleted() {
    return FirebaseFirestore.instance
        .collection('clients/$uid/myServices')
        .where('currentState', isEqualTo: 'Completed')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserMyServices.fromJson(doc.data()))
            .toList());
  }
}
