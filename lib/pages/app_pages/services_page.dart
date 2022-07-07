import 'package:flutter/material.dart';


class ServicesPage extends StatefulWidget {
  final PageController controller;
  const ServicesPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text('services')
      ],
    );
  }
}