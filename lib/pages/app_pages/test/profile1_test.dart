import 'package:flutter/material.dart';
import 'package:new_client_app/pages/complete_profile/profile1_page.dart';
import 'package:new_client_app/pages/complete_profile/profile2.dart';

class ProfileOneTest extends StatefulWidget {
  const ProfileOneTest({Key? key}) : super(key: key);

  @override
  State<ProfileOneTest> createState() => _ProfileOneTestState();
}

class _ProfileOneTestState extends State<ProfileOneTest> {
  final PageController _completeProfileController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProfileTwo(controller: _completeProfileController),
    );
  }
}
