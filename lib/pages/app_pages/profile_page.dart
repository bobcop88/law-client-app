import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final PageController controller;
  const ProfilePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('profile'),
        TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text('log out')),
      ],
    );
  }
}
