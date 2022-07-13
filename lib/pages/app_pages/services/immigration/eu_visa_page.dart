import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_client_app/pages/app_pages/services/preview_doc.dart';
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
                          TextButton(
                            onPressed: () {
                              _showSelectFile(context, doc1Name, previewdoc1,
                                  'Bank Statement');
                            },
                            style: const ButtonStyle(
                                visualDensity: VisualDensity.compact),
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
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize:
                                      MaterialStateProperty.all(Size.zero),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) =>
                                        PreviewDoc(file: link!))));
                              },
                              child: const Text(
                                'Preview',
                                style: TextStyle(fontSize: 12.0),
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
                          TextButton(
                            onPressed: () {
                              _showSelectFile(context, doc2Name, previewdoc2,
                                  'Empadronamiento');
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
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize:
                                      MaterialStateProperty.all(Size.zero),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) =>
                                        PreviewDoc(file: link!))));
                              },
                              child: const Text(
                                'Preview',
                                style: TextStyle(fontSize: 12.0),
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

  Future selectFile(fileName, previewFile, folder) async {
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

    docUrl = await snapshot.ref.getDownloadURL();
  }

  _showSelectFile(BuildContext context, doc, preview, folder) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    selectFile(doc, preview, folder);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Select from Device'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    cameraFile(doc, preview, folder);
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
                  title: Text('Select from Gallery'),
                  onTap: () {
                    selectFile(doc, preview, folder);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
                  onTap: () {
                    cameraFile(doc, preview, folder);
                  },
                ),
              ],
            );
          });
    }
  }

  Future cameraFile(fileName, previewFile, folder) async {
    final ImagePicker picker = ImagePicker();

    final XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 2,
    );
    if (photo == null) return;

    final path = '$user/euVisa/$folder/${photo.name}';

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(File(photo.path));
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

    docUrl = await snapshot.ref.getDownloadURL();
  }
}
