import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/my_services_completed.dart';
import 'package:new_client_app/pages/app_pages/services/my_services_pending.dart';

class MyServicesPage extends StatefulWidget {
  final PageController controller;
  const MyServicesPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<MyServicesPage> createState() => _MyServicesPageState();
}

class _MyServicesPageState extends State<MyServicesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: DefaultTabController(
            length: 2,
            initialIndex: 1,
            child: TabBar(
              controller: tabController,
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Pending'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Completed'),
                ),
              ],
              padding: const EdgeInsets.only(top: 10),
              // unselectedLabelColor: Color.fromRGBO(15, 48, 65, 1),
              // labelColor: Color.fromRGBO(250, 169, 22, 1),
              indicatorColor: const Color.fromRGBO(250, 169, 22, 1),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              PendingServices(),
              CompletedServices(),
            ],
          ),
        ),
      ],
    );
  }
}
