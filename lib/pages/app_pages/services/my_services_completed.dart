import 'package:flutter/material.dart';

class CompletedServices extends StatefulWidget {
  const CompletedServices({Key? key}) : super(key: key);

  @override
  State<CompletedServices> createState() => _CompletedServicesState();
}

class _CompletedServicesState extends State<CompletedServices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('completed')],
    );
  }
}
