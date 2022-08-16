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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator.adaptive()),
              ],
            );
          } else if (snapshot.data!.isEmpty) {
            return Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.content_paste,
                            size: 30.0,
                            color: Color.fromRGBO(250, 169, 22, 1),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'No Completed Services',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
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
