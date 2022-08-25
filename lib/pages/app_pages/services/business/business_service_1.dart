import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/utils/errors/error_no_docs.dart';
import 'package:new_client_app/utils/logs/database_logs.dart';
import 'package:new_client_app/utils/notifications/database_notifications.dart';
import 'package:new_client_app/utils/popUps/service_requested_popUp.dart';
import 'package:new_client_app/utils/services/database_services.dart';

class BusinessServiceOnePage extends StatefulWidget {
  const BusinessServiceOnePage({Key? pageKey}) : super(key: pageKey);

  @override
  State<BusinessServiceOnePage> createState() => _BusinessServiceOnePageState();
}

class _BusinessServiceOnePageState extends State<BusinessServiceOnePage> {
  final user = FirebaseAuth.instance.currentUser!.uid;
  String userName = '';
  String userEmail = '';
  final TextEditingController _field1 = TextEditingController();
  final TextEditingController _field2 = TextEditingController();
  final TextEditingController _field3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData(user);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final popUp = await showBackPopUp();
        return popUp ?? false;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
            title: const Text('Business Service 1'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 12.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 15.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      30, 250, 170, 22),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: const Icon(
                                                Icons.miscellaneous_services,
                                                color: Color.fromRGBO(
                                                    250, 169, 22, 1),
                                                size: 30.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: Text(
                                          'Business Service 1',
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 12.0, 10.0, 12.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'Business Service 1',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis, consequat mollis ex congue ut. Nam sagittis lacinia ipsum, id semper tellus.',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0),
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
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 12.0, 10.0, 12.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Expanded(
                                              child: Text(
                                                'Requirements',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.label,
                                                        size: 16.0,
                                                        color: Color.fromRGBO(
                                                            250, 169, 22, 1),
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Complete field information 1',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  const Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis,',
                                                    style: TextStyle(
                                                        fontSize: 11.0,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextField(
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0),
                                                          controller: _field1,
                                                          decoration:
                                                              const InputDecoration(
                                                            isDense: true,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        8.0),
                                                            // label: Text(AppLocalizations.of(context)!.profile1_name),
                                                            // labelStyle: const TextStyle(
                                                            //   color: Colors.black,
                                                            // ),
                                                            hintText:
                                                                'Enter information 1...',
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          15,
                                                                          48,
                                                                          65,
                                                                          1),
                                                                  width: 1.0,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1.0,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.label,
                                                        size: 16.0,
                                                        color: Color.fromRGBO(
                                                            250, 169, 22, 1),
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Complete field information 2',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  const Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis,',
                                                    style: TextStyle(
                                                        fontSize: 11.0,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextField(
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0),
                                                          controller: _field2,
                                                          // controller: _firstName,
                                                          decoration:
                                                              const InputDecoration(
                                                            isDense: true,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        8.0),
                                                            // label: Text(AppLocalizations.of(context)!.profile1_name),
                                                            // labelStyle: const TextStyle(
                                                            //   color: Colors.black,
                                                            // ),
                                                            hintText:
                                                                'Enter information 2...',
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          15,
                                                                          48,
                                                                          65,
                                                                          1),
                                                                  width: 1.0,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1.0,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.label,
                                                        size: 16.0,
                                                        color: Color.fromRGBO(
                                                            250, 169, 22, 1),
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Complete field information 3',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  const Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis,',
                                                    style: TextStyle(
                                                        fontSize: 11.0,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextField(
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      13.0),
                                                          // controller: _firstName,
                                                          controller: _field3,
                                                          decoration:
                                                              const InputDecoration(
                                                            isDense: true,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        8.0),
                                                            // label: Text(AppLocalizations.of(context)!.profile1_name),
                                                            // labelStyle: const TextStyle(
                                                            //   color: Colors.black,
                                                            // ),
                                                            hintText:
                                                                'Enter information 3...',
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          15,
                                                                          48,
                                                                          65,
                                                                          1),
                                                                  width: 1.0,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1.0,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_field1.text.trim().isEmpty ||
                                    _field2.text.trim().isEmpty ||
                                    _field3.text.trim().isEmpty) {
                                  ErrorNoDocs().errorNoFields(context);
                                  return;
                                }
                                Navigator.of(context).pop();
                                DatabaseService(uid: user).createMyServices(
                                    'Business Service 1',
                                    'not-applicable',
                                    'not-applicable',
                                    _field1.text.trim(),
                                    _field2.text.trim(),
                                    _field3.text.trim());
                                // requestSentPopUp();
                                PopUps().requestSentPopUp(
                                    context, 'Business Service 1', user);
                                DatabaseLogUser().createLogUser(
                                    user,
                                    'client',
                                    userEmail,
                                    'Request service Business 1',
                                    'Request');
                                EmailNotification().sendEmailServiceRequested(
                                    userName, 'Business Service 1', userEmail);

                                DatabaseNotificationsUserToAdmin(
                                        adminUser:
                                            'rVu8FOvKC3aoBcOiq4FKinZY42p1')
                                    .sendNotificationToAdmin(
                                        user,
                                        userName,
                                        userEmail,
                                        'Service',
                                        'New Service requested: Business Service 1');
                              },
                              child: const Text('Send request'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  errorPopUp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SimpleDialog(
            title: Text('Please upload a document'),
          );
        });
  }

  Future<bool?> showBackPopUp() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Are you leaving?',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Your request has not been completed. If you leave this page, your request will not be processed and you will need to resubmit all documents',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Continue request'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  fetchUserData(uid) async {
    await FirebaseFirestore.instance
        .collection('clients')
        .doc(uid)
        .get()
        .then((value) {
      setState(() {
        userName = value['firstName'] + ' ' + value['lastName'];
        userEmail = value['email'];
      });
    });
  }
}
