import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/immigration/eu_visa_page.dart';
import 'package:new_client_app/pages/app_pages/services/immigration_page.dart';
import 'package:new_client_app/utils/errors/error_service_exists.dart';
import 'package:new_client_app/utils/services/database_services.dart';

class HomeFirst extends StatefulWidget {
  final PageController controller;
  const HomeFirst({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeFirst> createState() => _HomeFirstState();
}

class _HomeFirstState extends State<HomeFirst> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.uid;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: const [
              Text(
                'Top Services',
                style: TextStyle(
                    color: Color.fromRGBO(15, 48, 65, 1),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            color: Color.fromRGBO(15, 48, 65, 1),
            thickness: 2,
            endIndent: 300,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: GestureDetector(
                    onTap: () async {
                      bool check = await DatabaseService(uid: user)
                          .checkService('EU Visa');
                      check
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EuVisaPage()))
                          : ErrorServiceExists(
                                  uid: user, serviceName: 'EU Visa')
                              .alertServiceExists(context);
                    },
                    child: Card(
                      elevation: 2,
                      shadowColor: const Color.fromRGBO(15, 48, 65, 1),
                      // color: const Color.fromRGBO(15, 48, 65, 1),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/briefcase.png',
                            height: 35.0,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'EU Visa',
                            style: TextStyle(
                                color: Color.fromRGBO(15, 48, 65, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Card(
                    elevation: 2,
                    shadowColor: const Color.fromRGBO(15, 48, 65, 1),
                    // color: const Color.fromRGBO(15, 48, 65, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/balance.png',
                          height: 35.0,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text(
                          'Service A',
                          style: TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Card(
                    elevation: 2,
                    shadowColor: const Color.fromRGBO(15, 48, 65, 1),
                    // color: const Color.fromRGBO(15, 48, 65, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/convergence.png',
                          height: 35.0,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text(
                          'Service B',
                          style: TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Card(
                    elevation: 2,
                    shadowColor: const Color.fromRGBO(15, 48, 65, 1),
                    // color: const Color.fromRGBO(15, 48, 65, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/note.png',
                          height: 35.0,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Text(
                          'Service C',
                          style: TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            children: const [
              Text(
                'Categories',
                style: TextStyle(
                    color: Color.fromRGBO(15, 48, 65, 1),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            color: Color.fromRGBO(15, 48, 65, 1),
            thickness: 2,
            endIndent: 300,
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ImmigrationPage()));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              const AssetImage('assets/images/immigration.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.darken)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Immigration',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: const AssetImage('assets/images/business.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Business',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: const AssetImage('assets/images/mobility.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Mobility',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image:
                            const AssetImage('assets/images/passport_img.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.darken)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Nationality & Citizenship',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            children: const [
              Text(
                'News',
                style: TextStyle(
                    color: Color.fromRGBO(15, 48, 65, 1),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            color: Color.fromRGBO(15, 48, 65, 1),
            thickness: 2,
            endIndent: 300,
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromRGBO(15, 48, 65, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  width: 200,
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Title of First News',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(15, 48, 65, 1)),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta et diam sit amet ullamcorper. Aenean maximus vulputate pharetra. Aliquam tincidunt dolor id sollicitudin efficitur. Sed faucibus id lorem pharetra consectetur. Nunc pulvinar commodo metus sed suscipit. Nulla bibendum non velit ut elementum',
                                style: TextStyle(fontSize: 11.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Read More',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromRGBO(15, 48, 65, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  width: 200,
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Title of First News',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(15, 48, 65, 1)),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porta et diam sit amet ullamcorper. Aenean maximus vulputate pharetra. Aliquam tincidunt dolor id sollicitudin efficitur. Sed faucibus id lorem pharetra consectetur. Nunc pulvinar commodo metus sed suscipit. Nulla bibendum non velit ut elementum',
                                style: TextStyle(fontSize: 11.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Read More',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
