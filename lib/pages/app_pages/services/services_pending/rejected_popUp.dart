import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RejectedWidget extends StatefulWidget {
  final String folder;
  const RejectedWidget({Key? key, required this.folder}) : super(key: key);

  @override
  State<RejectedWidget> createState() => _RejectedWidgetState();
}

class _RejectedWidgetState extends State<RejectedWidget> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String textUpload = 'Upload document';
  bool loadingDoc = false;
  final user = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(
        children: [
          Expanded(
              child: Text(
            'We\u0027re sorry, your service has been rejected',
            textAlign: TextAlign.center,
          ))
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Reason'),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin id metus porttitor, porttitor est ut, aliquam nisi. Ut vestibulum cursus leo, eget facilisis felis facilisis eget. Phasellus neque ante, convallis mollis maximus sit amet, ornare ut ante. Praesent tincidunt sem sed urna gravida dapibus.',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  !loadingDoc
                      ? TextButton(
                          onPressed: _showSelectFile,
                          child: Text(textUpload),
                        )
                      : Expanded(child: Text(textUpload)),
                  Visibility(
                    visible: loadingDoc,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ],
              ),
            ],
          ),
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

        // print('finished');
      });
    });

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
        loadingDoc = false;

        // print('finished');
      });
    });
  }
}
