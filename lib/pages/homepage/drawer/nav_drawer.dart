import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/main.dart';
import 'package:new_client_app/pages/app_pages/chat/chat_main_page.dart';
import 'package:new_client_app/pages/app_pages/company_details_drawer/about_us_page.dart';
import 'package:new_client_app/pages/app_pages/company_details_drawer/faqs_page.dart';
import 'package:new_client_app/pages/app_pages/company_details_drawer/terms_page.dart';
import 'package:new_client_app/pages/homepage/drawer/my_services_drawer.dart';
import 'package:new_client_app/pages/homepage/drawer/profile_drawer.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final PageController menuController = PageController();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: const [
                Text(
                  'Personal details',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.black,
                  size: 18.0,
                )),
            title: const Text('My Profile'),
            contentPadding: const EdgeInsets.only(left: 12.0),
            onTap: () {
              // scaffoldKey.currentState?.closeDrawer();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileDrawer()));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyServicesDrawer()));
            },
            leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.assignment_ind_outlined,
                  color: Colors.black,
                  size: 18.0,
                )),
            title: const Text('My Services'),
            contentPadding: const EdgeInsets.only(left: 12.0),
          ),
          ListTile(
            onTap: () {
              // scaffoldKey.currentState!.closeDrawer();
              chatFromMenu();
            },
            leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                  size: 18.0,
                )),
            title: const Text('Chat'),
            contentPadding: const EdgeInsets.only(left: 12.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: const [
                Text(
                  'Company Details',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.people_outline,
                  color: Colors.black,
                  size: 18.0,
                )),
            title: const Text('About us'),
            contentPadding: const EdgeInsets.only(left: 12.0),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutUsPage()));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TermsConditionsPage()));
            },
            leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.library_books_outlined,
                  color: Colors.black,
                  size: 18.0,
                )),
            title: const Text('Terms and Conditions'),
            contentPadding: const EdgeInsets.only(left: 12.0),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const FaqsPage()));
            },
            leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.beenhere_outlined,
                  color: Colors.black,
                  size: 18.0,
                )),
            title: const Text('FAQs'),
            contentPadding: const EdgeInsets.only(left: 12.0),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.logout_outlined,
                        color: Color.fromRGBO(250, 169, 22, 1),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Log out',
                        style:
                            TextStyle(color: Color.fromRGBO(250, 169, 22, 1)),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Version 1.0.1',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void chatFromMenu() async {
    bool exist = await FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .get()
        .then((value) => value.exists);

    if (exist) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChatPage(id: userId)));
    } else {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(userId)
          .set({'started': true});
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChatPage(id: userId)));
    }
  }
}
