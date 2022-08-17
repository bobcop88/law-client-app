import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/complete_profile/complete_profile_page.dart';

class ErrorCompleteProfile {
  errorComplete(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Please complete your profile',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'You need to complete your personal profile in order to start using Inscale Media App',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Text(
                      'Not now',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const CompleteProfilePage()));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const CompleteProfilePage()));
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
