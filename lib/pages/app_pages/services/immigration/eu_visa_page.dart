import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_client_app/pages/app_pages/services/preview_doc.dart';
import 'package:new_client_app/utils/errors/error_no_docs.dart';
import 'package:new_client_app/utils/logs/database_logs.dart';
import 'package:new_client_app/utils/notifications/database_notifications.dart';
import 'package:new_client_app/utils/popUps/service_requested_popUp.dart';
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
  String userName = '';
  String userEmail = '';
  var doc1Name = 'No bank statement selected';
  var doc2Name = 'No document selected';
  var previewdoc1 = false;
  var previewdoc2 = false;
  String? link = '';
  var doc1Url = '1';
  var doc2Url = '2';
  bool loadingDoc1 = false;
  bool loadingDoc2 = false;

  @override
  void initState() {
    super.initState();
    fetchUserData(user);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final popUp = await showBackPopUp();
        return popUp ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
          title: const Text('EU Visa'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
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
                                        color: const Color.fromARGB(
                                            30, 250, 170, 22),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Icon(
                                      Icons.miscellaneous_services,
                                      color: Color.fromRGBO(250, 169, 22, 1),
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                'EU Visa',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
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
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Eu Visa',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
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
                                        color: Colors.grey, fontSize: 12.0),
                                  ),
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
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Requirements',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.label,
                                            size: 16.0,
                                            color:
                                                Color.fromRGBO(250, 169, 22, 1),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            'Sufficient economic resources',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      const Text(
                                        'This can be demonstrated in various ways for example payslips or bank statements',
                                        style: TextStyle(
                                            fontSize: 11.0, color: Colors.grey),
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              _showSelectFile(
                                                  context,
                                                  doc1Name,
                                                  previewdoc1,
                                                  'Bank Statement',
                                                  doc1Url);
                                            },
                                            style: const ButtonStyle(
                                                visualDensity:
                                                    VisualDensity.compact),
                                            child: const Text('Upload'),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: Text(
                                              doc1Name,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: previewdoc1,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  minimumSize:
                                                      MaterialStateProperty.all(
                                                          Size.zero),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.zero)),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            PreviewDoc(
                                                              docUrl: doc1Url,
                                                            ))));
                                              },
                                              child: const Text(
                                                'Preview',
                                                style:
                                                    TextStyle(fontSize: 12.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: loadingDoc1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [buildProgress()],
                                        ),
                                      ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.label,
                                            size: 16.0,
                                            color:
                                                Color.fromRGBO(250, 169, 22, 1),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            'Empadronamiento',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      const Text(
                                        'This can be demonstrated in various ways for example payslips or bank statements',
                                        style: TextStyle(
                                            fontSize: 11.0, color: Colors.grey),
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              _showSelectFile(
                                                  context,
                                                  doc2Name,
                                                  previewdoc2,
                                                  'Empadronamiento',
                                                  doc2Url);
                                            },
                                            child: const Text('Upload'),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Expanded(
                                            child: Text(
                                              doc2Name,
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: previewdoc2,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  minimumSize:
                                                      MaterialStateProperty.all(
                                                          Size.zero),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.zero)),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            PreviewDoc(
                                                              docUrl: doc2Url,
                                                            ))));
                                              },
                                              child: const Text(
                                                'Preview',
                                                style:
                                                    TextStyle(fontSize: 12.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: loadingDoc2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [buildProgress()],
                                        ),
                                      ),
                                    ],
                                  ),
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (doc1Name == 'No document selected1' ||
                          doc2Name == 'No document selected') {
                        ErrorNoDocs().errorNoDocuments(context);

                        return;
                      }
                      Navigator.of(context).pop();
                      DatabaseService(uid: user).createMyServices(
                          'EU Visa',
                          doc1Url,
                          doc2Url,
                          'not-applicable',
                          'not-applicable',
                          'not-applicable');
                      EmailNotification().sendEmailServiceRequested(
                          userName, 'EU Visa', userEmail);
                      DatabaseLogUser().createLogUser(user, 'client', userEmail,
                          'Request service EU Visa', 'Request');
                      PopUps().requestSentPopUp(context, 'EU Visa', user);
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
      ),
    );
  }

  Widget buildProgress() {
    return StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('');
        } else {
          // final data = snapshot.data!;
          // double progress = data.bytesTransferred / data.totalBytes;
          return const CircularProgressIndicator.adaptive();
          // return Text(
          //   'Loading ${(100 * progress).roundToDouble()}%',
          //   style: TextStyle(fontSize: 11.0),
          // );
        }
      },
    );
  }

  Future selectFile(fileName, previewFile, folder, docUrl) async {
    final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });

    final path = '$user/euVisa/$folder/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      fileName == doc1Name ? loadingDoc1 = true : loadingDoc2 = true;
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        if (fileName == doc1Name) {
          doc1Name = pickedFile!.name;
          previewdoc1 = true;
          loadingDoc1 = false;
        }
        if (fileName == doc2Name) {
          doc2Name = pickedFile!.name;
          previewdoc2 = true;
          loadingDoc2 = false;
        }
        link = pickedFile!.path;

        // print('finished');
      });
    });

    final docUrlTemp = await snapshot.ref.getDownloadURL();
    setState(() {
      if (docUrl == doc1Url) {
        doc1Url = docUrlTemp;
      }
      if (docUrl == doc2Url) {
        doc2Url = docUrlTemp;
      }
    });
    setState(() {
      uploadTask = null;
    });
  }

  _showSelectFile(BuildContext context, doc, preview, folder, docUrl) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    selectFile(doc, preview, folder, docUrl);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Select from Device'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    cameraFile(doc, preview, folder, docUrl);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Camera'),
                ),
              ],
            );
          });
    } else {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('Select from Device'),
                  onTap: () {
                    selectFile(doc, preview, folder, docUrl);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    cameraFile(doc, preview, folder, docUrl);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  Future cameraFile(fileName, previewFile, folder, docUrl) async {
    // final ImagePicker picker = ImagePicker();

    final XFile? photo = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (photo == null) return;

    final path = '$user/euVisa/$folder/${photo.name}';

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(File(photo.path));
    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        if (fileName == doc1Name) {
          doc1Name = photo.name;
          previewdoc1 = true;
        }
        if (fileName == doc2Name) {
          doc2Name = photo.name;
          previewdoc2 = true;
        }
        link = photo.path;
        // print('finished');
      });
    });
    final docUrlTemp = await snapshot.ref.getDownloadURL();
    setState(() {
      if (docUrl == doc1Url) {
        doc1Url = docUrlTemp;
      }
      if (docUrl == doc2Url) {
        doc2Url = docUrlTemp;
      }
    });
  }

  Future<bool?> showBackPopUp() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Are you leaving?',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Your request has not been completed. If you leave this page, your request will not be processed and you will need to resubmit all documents',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      if (doc1Url != '1') {
                        FirebaseStorage.instance.refFromURL(doc1Url).delete();
                      }
                      if (doc2Url != '2') {
                        FirebaseStorage.instance.refFromURL(doc2Url).delete();
                      }
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  fetchUserData(uid) async {
    await FirebaseFirestore.instance
        .collection('clients')
        .doc(uid)
        .get()
        .then((value) {
      setState(() {
        userName = value['firstName'] + ' ' + value['lastName'];
        userEmail = value['email'];
      });
    });
  }
}
