import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RejectedWidget extends StatefulWidget {
  final String folder;
  final String rejectedReason;
  final bool rejectedNeedDoc;
  const RejectedWidget(
      {Key? key,
      required this.folder,
      required this.rejectedReason,
      required this.rejectedNeedDoc})
      : super(key: key);

  @override
  State<RejectedWidget> createState() => _RejectedWidgetState();
}

class _RejectedWidgetState extends State<RejectedWidget> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String textUpload = 'Upload document';
  bool loadingDoc = false;
  bool loadedDoc = false;
  String docUrl = '';
  final user = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(
        children: const [
          Expanded(
              child: Text(
            'We\u0027re sorry, your service has been rejected',
            textAlign: TextAlign.center,
          ))
        ],
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Reason',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.rejectedReason,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !loadedDoc
                          ? GestureDetector(
                              onTap: _showSelectFile,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 20.0,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    textUpload,
                                    style: TextStyle(
                                      color: Color.fromRGBO(250, 169, 22, 1),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: Text(
                              textUpload,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            )),
                      Visibility(
                        visible: loadingDoc,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    if (docUrl.isNotEmpty) {
                      FirebaseStorage.instance.refFromURL(docUrl).delete();
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Exit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Submit new document'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });

    final path = '$user/euVisa/${widget.folder}/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      loadingDoc = true;
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        textUpload = pickedFile!.name;
        loadingDoc = false;
        loadedDoc = true;

        // print('finished');
      });
    });
    docUrl = await snapshot.ref.getDownloadURL();

    setState(() {
      uploadTask = null;
    });
  }

  _showSelectFile() {
    if (Platform.isIOS) {
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
                CupertinoActionSheetAction(
                  onPressed: () {
                    cameraFile();
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
                    selectFile();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    cameraFile();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  Future cameraFile() async {
    // final ImagePicker picker = ImagePicker();

    final XFile? photo = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // imageQuality: 2,
    );
    if (photo == null) return;

    final path = '$user/euVisa/${widget.folder}/${photo.name}';

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      loadingDoc = true;
      uploadTask = ref.putFile(File(photo.path));
    });
    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        textUpload = pickedFile!.name;
        loadingDoc = true;

        // print('finished');
      });
    });
    docUrl = await snapshot.ref.getDownloadURL();
  }
}
