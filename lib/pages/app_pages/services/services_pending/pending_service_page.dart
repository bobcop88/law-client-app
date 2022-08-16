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
            return Column(
              children: [
                Center(child: CircularProgressIndicator.adaptive()),
              ],
            );
          } else {
            final service = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(30, 250, 170, 22),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                              child: Text(
                                service.serviceName,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [Text('Details')],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Icon(
                                  Icons.short_text,
                                  color: Color.fromRGBO(250, 169, 22, 1),
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  'Start Date: ',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
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
                                Icon(
                                  Icons.short_text,
                                  color: Color.fromRGBO(250, 169, 22, 1),
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Text(
                                  'Status: ',
                                  style: const TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                                Text(service.currentState),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.serviceName == 'Business Service 1'
                          ? true
                          : false,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Information 1'),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Icon(
                                    service.field1Status != 'Completed'
                                        ? Icons.access_alarm
                                        : Icons.check,
                                    size: 15.0,
                                    color: service.field1Status != 'Completed'
                                        ? Color.fromRGBO(250, 169, 22, 1)
                                        : Colors.green,
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.short_text,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 15.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Information provided: ',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Expanded(child: Text(service.field1)),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.short_text,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 15.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Status: ',
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Text(service.field1Status),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.serviceName == 'Business Service 1'
                          ? true
                          : false,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Information 2'),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Icon(
                                    service.field2Status != 'Completed'
                                        ? Icons.access_alarm
                                        : Icons.check,
                                    size: 15.0,
                                    color: service.field2Status != 'Completed'
                                        ? Color.fromRGBO(250, 169, 22, 1)
                                        : Colors.green,
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.short_text,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 15.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Information provided: ',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Expanded(child: Text(service.field2)),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.short_text,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 15.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Status: ',
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Text(service.field2Status),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.serviceName == 'Business Service 1'
                          ? true
                          : false,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Information 3'),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Icon(
                                    service.field3Status != 'Completed'
                                        ? Icons.access_alarm
                                        : Icons.check,
                                    size: 15.0,
                                    color: service.field3Status != 'Completed'
                                        ? Color.fromRGBO(250, 169, 22, 1)
                                        : Colors.green,
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.short_text,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 15.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Information provided: ',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Expanded(child: Text(service.field3)),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.short_text,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 15.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Text(
                                    'Status: ',
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  Text(service.field3Status),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.serviceName == 'EU Visa' ? true : false,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [Text('Document 1')],
                              ),
                              const Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.short_text,
                                              color: Color.fromRGBO(
                                                  250, 169, 22, 1),
                                              size: 15.0,
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            const Text(
                                              'Doc1 Status: ',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey),
                                            ),
                                            Expanded(
                                                child:
                                                    Text(service.doc1Status)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PreviewDoc(
                                                        docUrl: service.doc1Url,
                                                      )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
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
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.serviceName == 'EU Visa' ? true : false,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [Text('Document 2')],
                              ),
                              const Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.short_text,
                                              color: Color.fromRGBO(
                                                  250, 169, 22, 1),
                                              size: 15.0,
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            const Text(
                                              'Doc2 Status: ',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey),
                                            ),
                                            Expanded(
                                                child:
                                                    Text(service.doc2Status)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PreviewDoc(
                                                        docUrl: service.doc2Url,
                                                      )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
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
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
