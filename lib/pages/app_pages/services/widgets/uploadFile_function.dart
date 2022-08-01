import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_client_app/pages/app_pages/services/business/business_service_1.dart';

class TestUpload {
  Future selectFile(user, service, folder, doc) async {
    PlatformFile? pickedFile;
    UploadTask? uploadTask;
    String? link = '';
    final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result == null) return;

    pickedFile = result.files.first;

    final path = '$user/$service/$folder/${pickedFile.name}';
    final file = File(pickedFile.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {
      link = pickedFile!.path;
      doc = pickedFile.name;
    });
  }

  showSelectFile(BuildContext context, user, service, folder, doc) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    selectFile(user, service, folder, doc);

                    Navigator.of(context).pop();
                  },
                  child: const Text('Select from Device'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    // cameraFile(user,service,folder);
                    // Navigator.of(context).pop();
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
                    selectFile(user, service, folder, doc);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
                  onTap: () {
                    // cameraFile(doc, preview, folder, docUrl);
                    // Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}

class DocumentName extends StatefulWidget {
  Function(String) updateName;
  DocumentName({Key? key, required this.updateName}) : super(key: key);

  @override
  State<DocumentName> createState() => _DocumentNameState();
}

class _DocumentNameState extends State<DocumentName> {
  String doc = 'no document check';

  @override
  Widget build(BuildContext context) {
    return Text(doc);
  }

  Future selectFile(user, service, folder, doc) async {
    PlatformFile? pickedFile;
    UploadTask? uploadTask;
    String? link = '';
    final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result == null) return;

    pickedFile = result.files.first;

    final path = '$user/$service/$folder/${pickedFile.name}';
    final file = File(pickedFile.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    await uploadTask.whenComplete(() {
      print('completed');
      link = pickedFile!.path;
      doc = pickedFile.name;
      print(doc);
      widget.updateName(doc);
    });
  }

  showSelectFile(BuildContext context, user, service, folder, doc) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    selectFile(user, service, folder, doc);

                    Navigator.of(context).pop();
                  },
                  child: const Text('Select from Device'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    // cameraFile(user,service,folder);
                    // Navigator.of(context).pop();
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
                    selectFile(user, service, folder, doc);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
                  onTap: () {
                    // cameraFile(doc, preview, folder, docUrl);
                    // Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
