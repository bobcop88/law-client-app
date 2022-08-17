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
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        elevation: 0,
        title: const Text('Personal Profile'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ProfilePage(
                    controller: menuController,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }
}
