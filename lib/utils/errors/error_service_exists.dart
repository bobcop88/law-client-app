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

  alertServiceExists(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Service already requested',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You have already requested the service',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Color.fromRGBO(250, 169, 22, 1),
                      ),
                    ),
                  ),
                ],
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //     FirebaseAuth.instance.currentUser!.delete();
              //     // FirebaseAuth.instance.signOut();
              //   },
              //   child: Text('Exit'),
              // ),
            ],
          );
        });
  }
}
