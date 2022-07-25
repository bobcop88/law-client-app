import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/pages/app_pages/services/preview_doc.dart';
import 'package:new_client_app/utils/services/database_services.dart';
import 'package:new_client_app/utils/services/my_service_class.dart';

class ServicePendingPage extends StatefulWidget {
  String serviceName;
  String userId;
  ServicePendingPage(
      {Key? key, required this.serviceName, required this.userId})
      : super(key: key);

  @override
  State<ServicePendingPage> createState() => _ServicePendingPageState();
}

class _ServicePendingPageState extends State<ServicePendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: Text(widget.serviceName),
      ),
      body: StreamBuilder<UserMyServices>(
        stream: DatabaseService(uid: widget.userId)
            .readMyService(widget.serviceName),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            final service = snapshot.data!;
            return Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Start Date: ',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    Text(DateFormat('dd MMMM yyyy').format(
                        DateTime.fromMicrosecondsSinceEpoch(
                            service.creationDate))),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Status: ',
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    Text(service.currentState),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Doc1 Status: ',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    Text(service.doc1Status),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Doc1: ',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    GestureDetector(
                      child: Text('View Document'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PreviewDoc(
                                  file: '',
                                  docUrl: service.doc1Url,
                                )));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    const Text(
                      'Doc2: ',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    GestureDetector(
                      child: Text('View Document'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PreviewDoc(
                                  file: '',
                                  docUrl: service.doc2Url,
                                )));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
