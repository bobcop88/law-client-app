import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_client_app/utils/services/database_services.dart';

class EuVisaPage extends StatefulWidget {
  const EuVisaPage({Key? key}) : super(key: key);

  @override
  State<EuVisaPage> createState() => _EuVisaPageState();
}

class _EuVisaPageState extends State<EuVisaPage> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  final user = FirebaseAuth.instance.currentUser!.uid;
  var fileName = 'No document selected';
  var previewVisible = false;
  String? link = '';
  String docUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('EU Visa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'EU visa',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(15, 48, 65, 1)),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis, consequat mollis ex congue ut. Nam sagittis lacinia ipsum, id semper tellus.',
                    style: TextStyle(fontSize: 12.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20.0,
            ),
            Row(
              children: const [
                Text(
                  'Requirements',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 48, 65, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sufficient economic resources',
                      ),
                      const Text(
                        'This can be demonstrated in various ways for example payslips or bank statements',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                                visualDensity: VisualDensity.compact),
                            child: const Text('Upload'),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'No document uploaded',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Empadronamiento',
                      ),
                      const Text(
                        'Proof of your place of residence in Spain',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _showSelectFile(context);
                            },
                            child: const Text('Upload'),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'No document uploaded',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    DatabaseService(uid: user)
                        .createMyServices('EU Visa', docUrl, 'test');
                  },
                  child: const Text('Send request'),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });

    final path = '$user/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        fileName = pickedFile!.name;
        previewVisible = true;
        link = pickedFile!.path;
      });
    });

    docUrl = await snapshot.ref.getDownloadURL();
  }

  void _showSelectFile(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  selectFile();
                  Navigator.of(context).pop();
                },
                child: const Text('Select from Device'),
              ),
              // CupertinoActionSheetAction(
              //   onPressed: () {
              //     cameraFile();
              //   },
              //   child: Text(
              //     'Camera'
              //   ),
              // ),
            ],
          );
        });
  }
}
