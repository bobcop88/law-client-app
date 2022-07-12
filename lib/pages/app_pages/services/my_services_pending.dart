import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/utils/services/database_services.dart';
import 'package:new_client_app/utils/services/my_service_class.dart';

class PendingServices extends StatefulWidget {
  const PendingServices({Key? key}) : super(key: key);

  @override
  State<PendingServices> createState() => _PendingServicesState();
}

class _PendingServicesState extends State<PendingServices> {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserMyServices>>(
        stream: DatabaseService(uid: userId).readAllMyServicesPending(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            final services = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: services.map(buildService).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  Widget buildService(UserMyServices services) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    services.serviceName,
                    style: TextStyle(
                        color: Color.fromRGBO(15, 48, 65, 1),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Start Date: ',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Text(DateFormat('dd MMMM yyyy').format(
                    DateTime.fromMicrosecondsSinceEpoch(
                        services.creationDate))),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Text(services.currentState),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'Doc1 Status: ',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Text(services.doc1Status),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
