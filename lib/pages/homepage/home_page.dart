import 'dart:async';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/chat/chat_main_page.dart';
import 'package:new_client_app/pages/app_pages/home_first.dart';
import 'package:new_client_app/pages/app_pages/my_services_page.dart';
import 'package:new_client_app/pages/app_pages/notifications/notifications_page.dart';
import 'package:new_client_app/pages/app_pages/profile_page.dart';
import 'package:new_client_app/pages/app_pages/services_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController menuController = PageController();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  bool showNewChatMessage = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => checkNewChat(),
    );
  }

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        shadowColor: const Color.fromRGBO(15, 48, 65, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 50.0,
            ),
          ],
        ),
        actions: [
          Badge(
            badgeContent: const Text(
              '1',
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
            position: BadgePosition.topEnd(top: 10, end: 10),
            showBadge: showNewChatMessage ? true : false,
            child: IconButton(
              icon: const Icon(CupertinoIcons.chat_bubble_2),
              color: const Color.fromRGBO(15, 48, 65, 1),
              onPressed: () {
                updateLastMessage();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(id: userId)));
                checkNewChat();
              },
            ),
          ),
          Badge(
            badgeContent: const Text(
              '1',
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
            position: BadgePosition.topEnd(top: 10, end: 10),
            child: IconButton(
              icon: const Icon(CupertinoIcons.bell),
              color: const Color.fromRGBO(15, 48, 65, 1),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationsPage()));
              },
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        pageChanged(index);
                      },
                      controller: menuController,
                      children: [
                        HomeFirst(
                          controller: menuController,
                        ),
                        ServicesPage(
                          controller: menuController,
                        ),
                        MyServicesPage(controller: menuController),
                        ProfilePage(
                          controller: menuController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SalomonBottomBar(
          // height: 60.0,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.home_filled,
              ),
              title: const Text('Home'),
              selectedColor: const Color.fromRGBO(200, 36, 47, 1),
            ),
            SalomonBottomBarItem(
                icon: const Icon(
                  Icons.miscellaneous_services_outlined,
                ),
                title: const Text('Services'),
                selectedColor: const Color.fromRGBO(200, 36, 47, 1)),
            SalomonBottomBarItem(
                icon: const Icon(
                  CupertinoIcons.folder_badge_person_crop,
                ),
                title: const Text('My Services'),
                selectedColor: const Color.fromRGBO(200, 36, 47, 1)),
            SalomonBottomBarItem(
                icon: const Icon(
                  CupertinoIcons.person_fill,
                ),
                title: const Text('Profile'),
                selectedColor: const Color.fromRGBO(200, 36, 47, 1)),
          ],
          currentIndex: _selectedIndex,
          onTap: (_selectedIndex) {
            _onItemTapped(_selectedIndex);
            menuController.jumpToPage(_selectedIndex);
          },
        ),
      ),
    );
  }

  void checkNewChat() {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .get()
        .then((value) {
      if (value.data()!['isRead'] == false) {
        setState(() {
          showNewChatMessage = true;
        });
      } else {
        setState(() {
          showNewChatMessage = false;
        });
      }
    });
  }

  void updateLastMessage() {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .update({'isRead': true});
  }
}
