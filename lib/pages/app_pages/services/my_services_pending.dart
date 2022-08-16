import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/widgets/builService_widget.dart';
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
                        children: const [
                          Icon(
                            Icons.content_paste,
                            size: 30.0,
                            color: Color.fromRGBO(250, 169, 22, 1),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'No Pending Services',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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

  // Widget buildService(UserMyServices services) {
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
  //       child: Column(
  //         children: [
  //           Column(
  //             children: [
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 10.0, right: 15.0),
  //                     child: Column(
  //                       children: [
  //                         Container(
  //                           height: 45,
  //                           width: 45,
  //                           decoration: BoxDecoration(
  //                               color: Color.fromARGB(54, 250, 170, 22),
  //                               borderRadius: BorderRadius.circular(10)),
  //                           child: Icon(
  //                             Icons.miscellaneous_services,
  //                             color: Color.fromRGBO(250, 169, 22, 1),
  //                             size: 30.0,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Column(
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Expanded(
  //                               child: Text(
  //                                 services.serviceName,
  //                                 style: TextStyle(
  //                                     fontSize: 15.0,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         const SizedBox(
  //                           height: 3.0,
  //                         ),
  //                         Row(
  //                           children: [
  //                             Text(
  //                               'Start Date: ',
  //                               style: TextStyle(
  //                                   fontSize: 12.0, color: Colors.grey),
  //                             ),
  //                             Text(
  //                               DateFormat('dd MMMM yyyy').format(
  //                                   DateTime.fromMicrosecondsSinceEpoch(
  //                                       services.creationDate)),
  //                               style: TextStyle(fontSize: 12.0),
  //                             ),
  //                           ],
  //                         ),
  //                         const Divider(),
  //                         Row(
  //                           children: [
  //                             Text(
  //                               'Status: ',
  //                               style: TextStyle(
  //                                   fontSize: 12.0, color: Colors.grey),
  //                             ),
  //                             Text(
  //                               services.currentState,
  //                               style: TextStyle(
  //                                   fontSize: 12.0,
  //                                   color: services.currentState != 'Rejected'
  //                                       ? Colors.green
  //                                       : Colors.red),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// const Divider(),
//             Row(
//               children: [
//                 const Text(
//                   'Start Date: ',
//                   style: TextStyle(fontSize: 12.0, color: Colors.grey),
//                 ),
//                 Text(DateFormat('dd MMMM yyyy').format(
//                     DateTime.fromMicrosecondsSinceEpoch(
//                         services.creationDate))),
//               ],
//             ),
//             const SizedBox(
//               height: 5.0,
//             ),
//             Row(
//               children: [
//                 const Text(
//                   'Status: ',
//                   style: const TextStyle(fontSize: 12.0, color: Colors.grey),
//                 ),
//                 Text(services.currentState),
//               ],
//             ),

//             const SizedBox(
//               height: 5.0,
//             ),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => ServicePendingPage(
//                             serviceName: services.serviceName,
//                             userId: userId)));
//                   },
//                   child: Text(
//                     'See Details',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                 ),
//               ],
//             ),
