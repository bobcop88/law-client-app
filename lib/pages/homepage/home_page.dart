import 'dart:async';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/chat/chat_main_page.dart';
import 'package:new_client_app/pages/app_pages/homepage_first/home_first.dart';
import 'package:new_client_app/pages/app_pages/my_services_main_page/my_services_page.dart';
import 'package:new_client_app/pages/app_pages/notifications/notifications_page.dart';
import 'package:new_client_app/pages/app_pages/profile_page/profile_page.dart';
import 'package:new_client_app/pages/app_pages/services_main_page/services_page.dart';
import 'package:new_client_app/pages/complete_profile/complete_profile_page.dart';
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
  bool showNotificationBadge = false;
  Timer? timer;
  bool userCompleted = true;

  @override
  void initState() {
    super.initState();
    checkUserComplete();
    timer = Timer.periodic(const Duration(seconds: 2), (_) {
      checkNewChat();
      checkNewNotification(userId);
    });
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
        backgroundColor: Colors.white,
        elevation: 0,
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
            showBadge: showNotificationBadge,
            child: IconButton(
              icon: const Icon(CupertinoIcons.bell),
              color: const Color.fromRGBO(15, 48, 65, 1),
              onPressed: () {
                updateNotificationBadge();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationsPage(
                          id: userId,
                        )));
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
              selectedColor: const Color.fromRGBO(250, 169, 22, 1),
            ),
            SalomonBottomBarItem(
                icon: ImageIcon(
                    AssetImage('assets/icons/Servicios-BottomMenu.png')),
                title: const Text('Services'),
                selectedColor: const Color.fromRGBO(250, 169, 22, 1)),
            SalomonBottomBarItem(
                icon: const Icon(
                  CupertinoIcons.folder_badge_person_crop,
                ),
                title: const Text('My Services'),
                selectedColor: const Color.fromRGBO(250, 169, 22, 1)),
            SalomonBottomBarItem(
                icon: const Icon(
                  CupertinoIcons.person_fill,
                ),
                title: const Text('Profile'),
                selectedColor: const Color.fromRGBO(250, 169, 22, 1)),
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
      if (value.data()!['isRead'] == false &&
          value.data()!['senderLastMessage'] != userId) {
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

  checkNewNotification(userId) async {
    final collection = await FirebaseFirestore.instance
        .collection('clients/$userId/notificationsFromAdmin')
        .get();
    collection.docs.forEach((element) {
      if (element.data()['isNew'] == true) {
        setState(() {
          showNotificationBadge = true;
        });
      } else {
        setState(() {
          showNotificationBadge = false;
        });
      }
    });
  }

  void updateNotificationBadge() async {
    final collection = await FirebaseFirestore.instance
        .collection('clients/$userId/notificationsFromAdmin')
        .get();
    collection.docs.forEach((element) {
      element.reference.update({'isNew': false});
    });
  }

  void checkUserComplete() {
    FirebaseFirestore.instance
        .collection('clients')
        .doc(userId)
        .get()
        .then((doc) {
      if (doc.exists == false) {
        return errorComplete();
      }
    });
  }

  void errorComplete() {
    showDialog(
        context: context,
        builder: (BuildContext content) {
          return AlertDialog(
            title: Text('Please complete your profile'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CompleteProfilePage()));
                },
                child: Text('Complete now'),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                },
                child: Text('Not now'),
              ),
            ],
          );
        });
  }
}
