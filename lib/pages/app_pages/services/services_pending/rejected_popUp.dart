import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_client_app/utils/services/database_services.dart';

class RejectedWidget extends StatefulWidget {
  final String folder;
  final String rejectedReason;
  final bool rejectedNeedDoc;
  final String serviceName;
  const RejectedWidget(
      {Key? key,
      required this.folder,
      required this.rejectedReason,
      required this.rejectedNeedDoc,
      required this.serviceName})
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
  final textController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // const SizedBox(
              //   height: 100.0,
              // ),
              Row(
                children: const [
                  Expanded(
                      child: Text(
                    'We\u0027re sorry, your service has been rejected',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
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
                                  style: const TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        widget.rejectedNeedDoc ? uploadDoc() : getText(),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (docUrl.isNotEmpty) {
                                  FirebaseStorage.instance
                                      .refFromURL(docUrl)
                                      .delete();
                                }
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Do it later',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                DatabaseService(uid: user)
                                    .updateRejectedService(
                                        widget.serviceName,
                                        docUrl.isEmpty
                                            ? textController.text.trim()
                                            : docUrl);
                              },
                              child: const Text('Submit'),
                            ),
                          ],
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
    );
    // SimpleDialog(
    //   title: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     children: const [
    //       Expanded(
    //           child: Text(
    //         'We\u0027re sorry, your service has been rejected',
    //         textAlign: TextAlign.center,
    //       ))
    //     ],
    //   ),
    //   children: [
    //     Row(
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         Column(
    //           mainAxisSize: MainAxisSize.max,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 children: const [
    //                   Text(
    //                     'Reason',
    //                     style: TextStyle(fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             const Divider(),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                     child: Text(
    //                       widget.rejectedReason,
    //                       style: const TextStyle(
    //                           fontSize: 12.0, color: Colors.grey),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             widget.rejectedNeedDoc ? uploadDoc() : getText(),
    //             // Padding(
    //             //   padding: const EdgeInsets.all(8.0),
    //             //   child: Container(
    //             //     decoration: BoxDecoration(
    //             //         border: Border.all(color: Colors.grey),
    //             //         borderRadius: BorderRadius.circular(10)),
    //             //     child: Padding(
    //             //       padding: const EdgeInsets.all(12.0),
    //             //       child: Row(
    //             //         mainAxisSize: MainAxisSize.min,
    //             //         mainAxisAlignment: MainAxisAlignment.center,
    //             //         children: [
    //             //           !loadedDoc
    //             //               ? GestureDetector(
    //             //                   onTap: _showSelectFile,
    //             //                   child: Row(
    //             //                     children: [
    //             //                       Icon(
    //             //                         Icons.add_circle_outline,
    //             //                         size: 20.0,
    //             //                         color: Color.fromRGBO(250, 169, 22, 1),
    //             //                       ),
    //             //                       const SizedBox(
    //             //                         width: 5.0,
    //             //                       ),
    //             //                       Text(
    //             //                         textUpload,
    //             //                         style: TextStyle(
    //             //                           color: Color.fromRGBO(250, 169, 22, 1),
    //             //                         ),
    //             //                       ),
    //             //                     ],
    //             //                   ),
    //             //                 )
    //             //               : Expanded(
    //             //                   child: Text(
    //             //                   textUpload,
    //             //                   maxLines: 1,
    //             //                   textAlign: TextAlign.center,
    //             //                   overflow: TextOverflow.ellipsis,
    //             //                 )),
    //             //           Visibility(
    //             //             visible: loadingDoc,
    //             //             child: Center(
    //             //               child: CircularProgressIndicator.adaptive(),
    //             //             ),
    //             //           ),
    //             //         ],
    //             //       ),
    //             //     ),
    //             //   ),
    //             // ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 TextButton(
    //                   onPressed: () {
    //                     if (docUrl.isNotEmpty) {
    //                       FirebaseStorage.instance.refFromURL(docUrl).delete();
    //                     }
    //                     Navigator.of(context).pop();
    //                   },
    //                   child: const Text(
    //                     'Exit',
    //                     style: TextStyle(color: Colors.black),
    //                   ),
    //                 ),
    //                 ElevatedButton(
    //                   onPressed: () {},
    //                   child: const Text('Submit new document'),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // );
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

  Widget uploadDoc() {
    return Padding(
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
                          const Icon(
                            Icons.add_circle_outline,
                            size: 20.0,
                            color: Color.fromRGBO(250, 169, 22, 1),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            textUpload,
                            style: const TextStyle(
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
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getText() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Enter the required information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      hintText: 'Enter the required text',
                      contentPadding: EdgeInsets.all(8)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
