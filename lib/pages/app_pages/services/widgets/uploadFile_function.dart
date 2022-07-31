import 'package:flutter/material.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocument {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String user = '';
  var doc1Name = 'No document selected1';
  var doc2Name = 'No document selected';
  var previewdoc1 = false;
  var previewdoc2 = false;
  String? link = '';
  var doc1Url = '1';
  var doc2Url = '2';
  String serviceName = '';

  UploadDocument(
      {required this.pickedFile,
      required this.uploadTask,
      required this.user,
      required this.doc1Name,
      required this.doc2Name,
      required this.previewdoc1,
      required this.previewdoc2,
      required this.link,
      required this.doc1Url,
      required this.doc2Url,
      required this.serviceName});

  Future selectFile(fileName, previewFile, folder, docUrl) async {
    final result = await FilePicker.platform.pickFiles();
    // final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result == null) return;

    pickedFile = result.files.first;

    final path = '$user/$serviceName/$folder/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {
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

    final docUrlTemp = await snapshot.ref.getDownloadURL();

    if (docUrl == doc1Url) {
      doc1Url = docUrlTemp;
    }
    if (docUrl == doc2Url) {
      doc2Url = docUrlTemp;
    }
  }

  showSelectFile(BuildContext context, doc, preview, folder, docUrl) {
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
                  title: Text('Select from Gallery'),
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

    final path = '$user/$serviceName/$folder/${photo.name}';

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(File(photo.path));
    final snapshot = await uploadTask!.whenComplete(() {
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
    final docUrlTemp = await snapshot.ref.getDownloadURL();

    if (docUrl == doc1Url) {
      doc1Url = docUrlTemp;
    }
    if (docUrl == doc2Url) {
      doc2Url = docUrlTemp;
    }
  }
}
