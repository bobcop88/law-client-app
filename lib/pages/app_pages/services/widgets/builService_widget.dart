import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/pages/app_pages/services/services_pending/pending_service_page.dart';

class BuildServiceWidget {
  BuildContext context;

  BuildServiceWidget({required this.context});

  Widget buildService(services) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ServicePendingPage(
                serviceName: services.serviceName, userId: services.userId)));
      },
      child: Card(
        color: services.currentState != 'Completed'
            ? Colors.white
            : Colors.green[100],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(54, 250, 170, 22),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.miscellaneous_services,
                                color: Color.fromRGBO(250, 169, 22, 1),
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    services.serviceName,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Start Date: ',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                                Text(
                                  DateFormat('dd MMMM yyyy').format(
                                      DateTime.fromMicrosecondsSinceEpoch(
                                          services.creationDate)),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Text(
                                  'Status: ',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                                Text(
                                  services.currentState,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: services.currentState != 'Rejected'
                                          ? Colors.green
                                          : Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
