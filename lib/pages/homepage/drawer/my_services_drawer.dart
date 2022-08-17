import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/my_services_main_page/my_services_page.dart';

class MyServicesDrawer extends StatefulWidget {
  const MyServicesDrawer({Key? key}) : super(key: key);

  @override
  State<MyServicesDrawer> createState() => _MyServicesDrawerState();
}

class _MyServicesDrawerState extends State<MyServicesDrawer> {
  final PageController menuController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        elevation: 0,
        title: const Text('My Services'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: MyServicesPage(controller: menuController)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
