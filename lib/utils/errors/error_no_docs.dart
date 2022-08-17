import 'package:flutter/material.dart';

class ErrorNoDocs {
  errorNoDocuments(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Documents are missing',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
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
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
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

  errorNoFields(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'One or more fields are not completed',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'You need to complete all required fields in order to request the service',
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
                    style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Complete now',
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
