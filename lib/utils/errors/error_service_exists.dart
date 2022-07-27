import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ErrorServiceExists {
  String uid;
  String serviceName;

  ErrorServiceExists({required this.uid, required this.serviceName});

  checkServiceExists() async {
    return await FirebaseFirestore.instance
        .collection('clients/$uid/myServices/')
        .doc(serviceName)
        .get()
        .then((service) {
      print(service.exists);
      service.exists ? true : false;
    });
  }
}
