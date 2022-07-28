import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/utils/logs/log_class.dart';

class DatabaseLogUser {
  final CollectionReference logs =
      FirebaseFirestore.instance.collection('logs');

  Future createLogUser(String id, String typeUser, String email, String action,
      String logType) async {
    final logUser =
        logs.doc((DateTime.now().microsecondsSinceEpoch).toString());

    final createLogUser = Log(
        id: id,
        typeUser: typeUser,
        emailAddress: email,
        action: action,
        logType: logType,
        dateLog: DateTime.now().microsecondsSinceEpoch);

    final json = createLogUser.toJson();
    await logUser.set(json);
  }
}
