import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/widgets/builService_widget.dart';
import 'package:new_client_app/pages/app_pages/test/profile1_test.dart';
import 'package:new_client_app/pages/complete_profile/profile1_page.dart';
import 'package:new_client_app/utils/services/database_services.dart';
import 'package:new_client_app/utils/services/my_service_class.dart';

class CompletedServices extends StatefulWidget {
  const CompletedServices({Key? key}) : super(key: key);

  @override
  State<CompletedServices> createState() => _CompletedServicesState();
}

class _CompletedServicesState extends State<CompletedServices> {
  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<List<UserMyServices>>(
        stream: DatabaseService(uid: userId).readAllMyServicesCompleted(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Completed Services'),
                  ],
                ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => ProfileOneTest()));
                //   },
                //   child: Text('complete'),
                // ),
              ],
            );
          } else {
            final services = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: services
                          .map(
                              BuildServiceWidget(context: context).buildService)
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
