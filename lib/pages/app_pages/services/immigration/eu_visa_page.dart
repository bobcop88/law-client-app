import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_client_app/pages/app_pages/services/my_services_pending.dart';
import 'package:new_client_app/pages/app_pages/services/preview_doc.dart';
import 'package:new_client_app/pages/app_pages/services/services_pending/pending_service_page.dart';
import 'package:new_client_app/utils/errors/error_no_docs.dart';
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
  var doc1Name = 'No document selected1';
  var doc2Name = 'No document selected';
  var previewdoc1 = false;
  var previewdoc2 = false;
  String? link = '';
  var doc1Url = '1';
  var doc2Url = '2';
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
                              children: [
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
                              children: [
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
                              children: [
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
                                        children: [
                                          Icon(
                                            Icons.label,
                                            size: 16.0,
                                            color:
                                                Color.fromRGBO(250, 169, 22, 1),
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          const Text(
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
                                                              file: link!,
                                                              docUrl: '',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.label,
                                            size: 16.0,
                                            color:
                                                Color.fromRGBO(250, 169, 22, 1),
                                          ),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          const Text(
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
                                                              file: link!,
                                                              docUrl: '',
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
                                      // Row(
                                      //   children: [
                                      //     ElevatedButton(
                                      //       onPressed: cameraFile,
                                      //       child: Text('Camera'),
                                      //     ),
                                      //   ],
                                      // ),
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
                      DatabaseService(uid: user)
                          .createMyServices('EU Visa', doc1Url, doc2Url);
                      requestSentPopUp();
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
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        if (fileName == doc1Name) {
          doc1Name = pickedFile!.name;
          previewdoc1 = true;
        }
        if (fileName == doc2Name) {
          doc2Name = pickedFile!.name;
          previewdoc2 = true;
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
                  child: Text('Camera'),
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
                  leading: Icon(Icons.folder),
                  title: Text('Select from Device'),
                  onTap: () {
                    selectFile(doc, preview, folder, docUrl);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
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
      // imageQuality: 2,
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

  requestSentPopUp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Your request has been sent'),
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ServicePendingPage(
                                serviceName: 'EU Visa',
                                userId: user,
                              )));
                    },
                    child: Text('Go to Service'),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  errorPopUp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Please upload a document'),
          );
        });
  }

  Future<bool?> showBackPopUp() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Do you want to qui?'),
            actions: [
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
                child: Text('Exit'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('Continue request'),
              ),
            ],
          );
        });
  }
}
