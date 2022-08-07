import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorNoDocs {
  errorNoDocuments(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Documents are missing',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You need to upload all documents in order to request the service',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  textAlign: TextAlign.center,
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
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Upload now',
                      style: TextStyle(color: Color.fromRGBO(250, 169, 22, 1)),
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
