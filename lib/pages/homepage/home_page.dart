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
import 'package:new_client_app/pages/homepage/drawer/end_drawer_notifications.dart';
import 'package:new_client_app/pages/homepage/drawer/nav_drawer.dart';
import 'package:new_client_app/utils/chat/chat_class.dart';
import 'package:new_client_app/utils/chat/database_chat.dart';
import 'package:new_client_app/utils/errors/error_complete_profile.dart';
import 'package:new_client_app/utils/notifications/database_notifications.dart';
import 'package:new_client_app/utils/notifications/notification_class.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  final PageController menuController = PageController();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  bool showNewChatMessage = false;
  bool showNotificationBadge = false;
  Timer? timer;
  bool userCompleted = false;

  @override
  void initState() {
    super.initState();
    checkUserComplete();
    // timer = Timer.periodic(const Duration(seconds: 4), (_) {
    //   // checkNewChat();
    //   checkNewNotification(userId);
    // });
  }

  // void checkNew() {
  //   timer = Timer.periodic(const Duration(seconds: 4), (_) {
  //     checkNewChat();
  //     checkNewNotification(userId);
  //   });
  // }

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
    // timer?.cancel();
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
            Expanded(
              child: Image.asset(
                'assets/logo_neu.png',
                height: 50.0,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.sort,
            color: Colors.black,
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          StreamBuilder<DocumentSnapshot>(
              stream: DatabaseChat().newChatMessages(userId),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return IconButton(
                    icon: const Icon(CupertinoIcons.chat_bubble_2),
                    color: const Color.fromRGBO(15, 48, 65, 1),
                    onPressed: () {
                      updateLastMessage();
                      if (showNewChatMessage == true) {
                        setState(() {
                          showNewChatMessage = false;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChatPage(id: userId)));
                      }
                      // checkNewChat();
                    },
                  );
                } else {
                  final chats = snapshot.data!;

                  if (chats['isRead'] == false &&
                      chats['senderLastMessage'] != userId) {
                    showNewChatMessage = true;
                  }

                  return Badge(
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
                        if (showNewChatMessage == true) {
                          showNewChatMessage = false;
                        }
                        // checkNewChat();
                      },
                    ),
                  );
                }
              }),
          StreamBuilder<List<NotificationAdminDetails>>(
              stream: DatabaseNotifications().newNotificationsFromAdmin(userId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Badge(
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
                        // updateNotificationBadge();
                        scaffoldKey.currentState!.openEndDrawer();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => NotificationsPage(
                        //           id: userId,
                        //         )));
                      },
                    ),
                  );
                } else {
                  final notifications = snapshot.data!;
                  final newNotification =
                      notifications.any((element) => element.isNew == true);

                  if (newNotification) {
                    showNotificationBadge = true;
                  }

                  // for (var element in notifications) {
                  //   if (element.isNew == true) {
                  //     showNotificationBadge = true;
                  //   } else {
                  //     showNotificationBadge = false;
                  //   }
                  // }

                  return Badge(
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

                        if (showNotificationBadge == true) {
                          showNotificationBadge = false;
                        }
                        scaffoldKey.currentState!.openEndDrawer();
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => NotificationsPage(
                        //           id: userId,
                        //         )));
                      },
                    ),
                  );
                }
              }),
          const SizedBox(
            width: 5.0,
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Scaffold(
        key: scaffoldKey,
        drawer: const SideMenu(),
        endDrawer: EndDrawerNotifications(id: userId),
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
                icon: const ImageIcon(
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

  // void checkNewChat() async {
  //   final chat =
  //       FirebaseFirestore.instance.collection('chats').doc(userId).get();

  //   if (await chat.then((value) => value.exists) == true) {
  //     FirebaseFirestore.instance
  //         .collection('chats')
  //         .doc(userId)
  //         .get()
  //         .then((value) {
  //       if (value.data()!['isRead'] == false &&
  //           value.data()!['senderLastMessage'] != userId) {
  //         setState(() {
  //           if (!mounted) return;
  //           showNewChatMessage = true;
  //         });
  //       } else {
  //         setState(() {
  //           if (!mounted) return;
  //           showNewChatMessage = false;
  //         });
  //       }
  //     });
  //   } else {
  //     FirebaseFirestore.instance
  //         .collection('chats')
  //         .doc(userId)
  //         .set({'started': true});
  //   }
  // }

  void updateLastMessage() {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .update({'isRead': true});
  }

  // checkNewNotification(userId) async {
  //   final collection = await FirebaseFirestore.instance
  //       .collection('clients/$userId/notificationsFromAdmin')
  //       .get();
  //   if (collection.docs.isEmpty) {
  //     if (!mounted) return;
  //     setState(() {
  //       showNotificationBadge = false;
  //     });
  //   }
  //   collection.docs.forEach((element) {
  //     if (element.data()['isNew'] == true) {
  //       if (!mounted) return;
  //       setState(() {
  //         showNotificationBadge = true;
  //       });
  //     } else {
  //       if (!mounted) return;
  //       setState(() {
  //         showNotificationBadge = false;
  //       });
  //     }
  //   });
  // }

  void updateNotificationBadge() async {
    // setState(() {
    //   showNotificationBadge = false;
    // });
    final collection = await FirebaseFirestore.instance
        .collection('clients/$userId/notificationsFromAdmin')
        .get();
    for (var element in collection.docs) {
      element.reference.update({'isNew': false});
    }
  }

  void checkUserComplete() {
    FirebaseFirestore.instance
        .collection('clients')
        .doc(userId)
        .get()
        .then((doc) {
      if (doc['userCompleted'] == false) {
        return ErrorCompleteProfile().errorComplete(context);
      }
    });
  }
}
