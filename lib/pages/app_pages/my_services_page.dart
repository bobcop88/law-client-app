import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/pages/app_pages/services/my_services_completed.dart';
import 'package:new_client_app/pages/app_pages/services/my_services_pending.dart';
import 'package:new_client_app/utils/services/database_services.dart';
import 'package:new_client_app/utils/services/my_service_class.dart';

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
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
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
            padding: EdgeInsets.all(8.0),
            unselectedLabelColor: Color.fromRGBO(15, 48, 65, 1),
            labelColor: Color.fromRGBO(200, 36, 47, 1),
            indicatorColor: Color.fromRGBO(200, 36, 47, 1),
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
