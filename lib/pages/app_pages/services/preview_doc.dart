import 'dart:io';
import 'package:flutter/material.dart';

class PreviewDoc extends StatefulWidget {
  String docUrl;
  PreviewDoc({Key? key, required this.docUrl}) : super(key: key);

  @override
  State<PreviewDoc> createState() => _PreviewDocState();
}

class _PreviewDocState extends State<PreviewDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Document'),
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: Image.network(widget.docUrl),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
