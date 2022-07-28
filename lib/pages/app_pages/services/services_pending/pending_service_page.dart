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
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Service Details',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20.0,
                    thickness: 2,
                    endIndent: 250,
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
                  // const SizedBox(
                  //   height: 5.0,
                  // ),
                  // Row(
                  //   children: [
                  //     const Text(
                  //       'Doc1: ',
                  //       style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  //     ),
                  //     GestureDetector(
                  //       child: Text('View Document'),
                  //       onTap: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => PreviewDoc(
                  //                   file: '',
                  //                   docUrl: service.doc1Url,
                  //                 )));
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 5.0,
                  // ),
                  // Row(
                  //   children: [
                  //     const Text(
                  //       'Doc2: ',
                  //       style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  //     ),
                  //     GestureDetector(
                  //       child: Text('View Document'),
                  //       onTap: () {
                  //         Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (context) => PreviewDoc(
                  //                   file: '',
                  //                   docUrl: service.doc2Url,
                  //                 )));
                  //       },
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PreviewDoc(
                                        file: '',
                                        docUrl: service.doc1Url,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width / 4,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.network(
                                  service.doc1Url,
                                  scale: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Document 1',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PreviewDoc(
                                        file: '',
                                        docUrl: service.doc2Url,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              width: MediaQuery.of(context).size.width / 4,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.network(
                                  service.doc2Url,
                                  scale: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Document 2',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
