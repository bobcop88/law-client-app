import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/profile_page/profile_page.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  final PageController menuController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 48, 65, 1),
        elevation: 0,
        title: Text('Personal Profile'),
      ),
      body: ProfilePage(
        controller: menuController,
      ),
    );
  }
}
