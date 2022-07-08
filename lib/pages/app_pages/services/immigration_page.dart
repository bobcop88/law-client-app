import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/immigration/eu_visa_page.dart';

class ImmigrationPage extends StatefulWidget {
  const ImmigrationPage({Key? key}) : super(key: key);

  @override
  State<ImmigrationPage> createState() => _ImmigrationPageState();
}

class _ImmigrationPageState extends State<ImmigrationPage> {
  final user = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    nationalityUser();
  }

  String nationality = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('Immigration Services'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 5,
                  shadowColor: Color.fromRGBO(15, 48, 65, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'EU Visa',
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 48, 65, 1),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              nationality == 'Bulgaria'
                                  ? Icons.check_circle
                                  : Icons.close,
                              size: 14.0,
                              color: nationality == 'Bulgaria'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis, consequat mollis ex congue ut. Nam sagittis lacinia ipsum, id semper tellus.',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: nationality == 'Bulgaria'
                              ? () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EuVisaPage()));
                                }
                              : null,
                          child: Text('Request service'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 5,
                  shadowColor: Color.fromRGBO(15, 48, 65, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'NON-EU Visa',
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 48, 65, 1),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              nationality != 'Bulgaria'
                                  ? Icons.check_circle
                                  : Icons.close_outlined,
                              size: 14.0,
                              color: nationality != 'Bulgaria'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis, consequat mollis ex congue ut. Nam sagittis lacinia ipsum, id semper tellus.',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: nationality != 'Bulgaria' ? () {} : null,
                          child: Text('Request service'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void nationalityUser() {
    FirebaseFirestore.instance
        .collection('clients')
        .doc(user)
        .get()
        .then((value) {
      setState(() {
        nationality = value.data()!['nationality'];
      });
    });
  }
}
