import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PreviewDoc extends StatefulWidget {
  final String docUrl;
  const PreviewDoc({Key? key, required this.docUrl}) : super(key: key);

  @override
  State<PreviewDoc> createState() => _PreviewDocState();
}

class _PreviewDocState extends State<PreviewDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Document'),
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: WebView(
                  initialUrl: widget.docUrl,
                ),
                // Image.network(widget.docUrl),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
