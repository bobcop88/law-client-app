import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFirst extends StatefulWidget {
  final PageController controller;
  const HomeFirst({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeFirst> createState() => _HomeFirstState();
}

class _HomeFirstState extends State<HomeFirst> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Text(
              'Top Services',
              style: TextStyle(
                  color: Color.fromRGBO(15, 48, 65, 1),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.flag_circle),
                      Text('Service One'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.flag_circle),
                      Text('Service One'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.flag_circle),
                      Text('Service One'),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.flag_circle),
                      Text('Service One'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
