import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ErrorDialog {
  errorFieldMissing(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Missing fields'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text('Some fields are missing')],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Complete now'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  FirebaseAuth.instance.currentUser!.delete();
                  // FirebaseAuth.instance.signOut();
                },
                child: Text('Exit'),
              ),
            ],
          );
        });
  }
}
