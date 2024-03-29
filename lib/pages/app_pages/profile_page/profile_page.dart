import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/main.dart';
import 'package:new_client_app/pages/register_page/forgot_password_page.dart';
import 'package:new_client_app/utils/users/database_users.dart';
import 'package:new_client_app/utils/users/user_class.dart';

class ProfilePage extends StatefulWidget {
  final PageController controller;
  const ProfilePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserAllDetails?>(
      stream: DatabaseUsers(uid: user.uid).readUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final userDetails = snapshot.data!;
          return Column(
            children: [
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(15, 48, 65, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25.0,
                                child: Text(
                                  userDetails.firstName.split(' ')[0][0] +
                                      userDetails.lastName.split(' ')[0][0],
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Color.fromRGBO(15, 48, 65, 1)),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${userDetails.firstName} ${userDetails.lastName}',
                                      style: const TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Registered on: ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd MMMM yyyy').format(
                                        DateTime.fromMicrosecondsSinceEpoch(
                                            snapshot.data!.dateCreation)),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 10.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // const Divider(
              //   thickness: 2,
              //   color: Color.fromRGBO(15, 48, 65, 1),
              //   indent: 150,
              //   endIndent: 150,
              // ),
              Expanded(
                flex: 3,
                child: ListView(
                  padding: const EdgeInsets.all(10.0),
                  children: [
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.phone_fill,
                          color: Color.fromRGBO(250, 169, 22, 1),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phone number',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              snapshot.data!.phoneNumber,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 20.0,
                      color: Colors.grey[500],
                    ),
                    // SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Color.fromRGBO(250, 169, 22, 1),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email address',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              snapshot.data!.email,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 20.0,
                      color: Colors.grey[500],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: Color.fromRGBO(250, 169, 22, 1),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Date of Birth',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              DateFormat('dd MMMM yyyy').format(
                                  DateTime.fromMicrosecondsSinceEpoch(
                                      userDetails.dateOfBirth)),
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 20.0,
                      color: Colors.grey[500],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.flag,
                          color: Color.fromRGBO(250, 169, 22, 1),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nationality',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              userDetails.nationality,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 20.0,
                      color: Colors.grey[500],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.public_sharp,
                          color: Color.fromRGBO(250, 169, 22, 1),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Document Number',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              userDetails.documentNumber,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Color.fromRGBO(15, 48, 65, 1),
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    label: const Text('Log out'),
                    icon: const Icon(Icons.logout_outlined),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
