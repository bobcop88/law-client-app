import 'package:flutter/material.dart';
import 'package:new_client_app/pages/complete_profile/profile1_page.dart';
import 'package:new_client_app/pages/complete_profile/profile2.dart';
import 'package:new_client_app/pages/complete_profile/welcome_page.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final PageController _completeProfileController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                // allowImplicitScrolling: false,
                controller: _completeProfileController,
                children: [
                  WelcomePageProfile(
                    controller: _completeProfileController,
                  ),
                  ProfileOne(
                    controller: _completeProfileController,
                  ),
                  ProfileTwo(
                    controller: _completeProfileController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changePage(int index) {
    _completeProfileController.animateTo(1,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
