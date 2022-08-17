import 'package:flutter/material.dart';

class ErrorDialog {
  errorFieldMissing(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Missing Details',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'One or more fields required are missing. Please make sure to complete all fields in order to continue',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // TextButton(
                  //   onPressed: () {

                  //     // Navigator.of(context).pop();
                  //     // FirebaseAuth.instance.currentUser!.delete();
                  //     FirebaseAuth.instance.signOut();
                  //   },
                  //   child: Text(
                  //     'Exit',
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Complete now'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
