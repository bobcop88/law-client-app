import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/home_first.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        shadowColor: Color.fromRGBO(15, 48, 65, 1),
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              color: Color.fromRGBO(15, 48, 65, 1),
              onPressed: () {},
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
        decoration: BoxDecoration(color: Colors.white),
        child: SalomonBottomBar(
          // height: 60.0,
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              title: Text('Home'),
              selectedColor: Color.fromRGBO(200, 36, 47, 1),
            ),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.miscellaneous_services_outlined,
                ),
                title: Text('Services'),
                selectedColor: Color.fromRGBO(200, 36, 47, 1)),
            SalomonBottomBarItem(
                icon: Icon(
                  Icons.contact_support_outlined,
                ),
                title: Text('Contact'),
                selectedColor: Color.fromRGBO(200, 36, 47, 1)),
          ],
          currentIndex: _selectedIndex,
          onTap: (_selectedIndex) {
            _onItemTapped(_selectedIndex);
            menuController.jumpToPage(_selectedIndex);
          },
          // backgroundColor: Colors.white,
          // selectedItemColor: Color.fromRGBO(253, 69, 77, 1),
          // selectedIconTheme: IconThemeData(
          //   color: Color.fromRGBO(253, 69, 77, 1),
          // ),
          // showUnselectedLabels: false,
        ),
      ),
    );
  }
}

// BoxDecoration(
//           border: Border(top: BorderSide(color: Colors.grey)),
//         ),
//         child: BottomNavigationBar(
//           // height: 60.0,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home_filled,
//               ),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.miscellaneous_services_outlined,
//               ),
//               label: 'Services',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.contact_support_outlined,
//               ),
//               label: 'Contact',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           onTap: (_selectedIndex) {
//             _onItemTapped(_selectedIndex);
//             menuController.jumpToPage(_selectedIndex);
//           },
//           backgroundColor: Colors.white,
//           selectedItemColor: Color.fromRGBO(253, 69, 77, 1),
//           selectedIconTheme: IconThemeData(
//             color: Color.fromRGBO(253, 69, 77, 1),
//           ),
//           showUnselectedLabels: false,
//         ),
