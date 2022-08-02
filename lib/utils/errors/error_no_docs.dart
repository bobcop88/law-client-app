import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorNoDocs {
  errorNoDocuments(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please upload all requested documents'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'You need to upload all documents in order to request the service')
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Upload now'),
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
