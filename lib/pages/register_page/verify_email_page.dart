import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/main.dart';
import 'package:new_client_app/pages/complete_profile/complete_profile_page.dart';
import 'package:new_client_app/pages/login_page/login_page.dart';
import 'package:new_client_app/pages/register_page/register.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmailVerification = false;
  String user = FirebaseAuth.instance.currentUser!.uid;
  String email = FirebaseAuth.instance.currentUser!.email!;

  Timer? timer;
  Timer? timerResendEmail;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      // sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );

      timerResendEmail =
          Timer(const Duration(minutes: 1), () => setTimerResendEmail());
    }

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  setTimerResendEmail() {
    setState(() {
      canResendEmailVerification = true;
    });
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      // setState(() {
      //   canResendEmailVerification = false;
      // });
      // await Future.delayed(const Duration(seconds: 10));
      // setState(() {
      //   canResendEmailVerification = true;
      // });
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('The email has been sent again'),
      //         content: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [Text('Please verify your email address')],
      //         ),
      //         actions: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //             child: Text('Close'),
      //           ),
      //         ],
      //       );
      //     });
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEmailVerified) {
      return const CompleteProfilePage();
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
              child: Row(
                children: [Expanded(child: Image.asset('assets/logo.png'))],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'The verification email has been sent to $email',
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -1),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, left: 50.0, right: 50.0),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Please check your inbox (also in Spam)',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (canResendEmailVerification) {
                                  sendVerificationEmail();
                                  dialogResentVerificationEmail();
                                  setState(() {
                                    canResendEmailVerification = false;
                                  });
                                  Timer(const Duration(minutes: 1),
                                      () => setTimerResendEmail());
                                } else {
                                  errorResendNotAvailable();
                                }

                                // canResendEmailVerification
                                //     ? sendVerificationEmail()
                                //     : null;
                                // dialogResentVerificationEmail();
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(15)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              child: const Text(
                                'Resend email',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () async {
                              timer?.cancel();
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MainPage()));

                              deleteRecordsDatabase(user);
                              await FirebaseAuth.instance.currentUser!.delete();
                            },
                            child: const Text(
                              'It\u0027s not my email address',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  dialogResentVerificationEmail() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('The email has been sent again'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Please verify your email address',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: Color.fromRGBO(250, 169, 22, 1),
                  ),
                ),
              ),
            ],
          );
        });
  }

  errorResendNotAvailable() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please check your inbox'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'The email verification has been sent to your email address. Please check also in Spam. You can request a new verification email in 2 minutes.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: Color.fromRGBO(250, 169, 22, 1),
                  ),
                ),
              ),
            ],
          );
        });
  }

  deleteRecordsDatabase(uid) {
    FirebaseFirestore.instance
        .collection('clients/$uid/notificationsFromAdmin')
        .doc('first')
        .delete();
    FirebaseFirestore.instance.collection('clients').doc(uid).delete();
  }
}
