import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/business/business_main_page.dart';
import 'package:new_client_app/pages/app_pages/services/immigration/immigration_page.dart';

class ServicesPage extends StatefulWidget {
  final PageController controller;
  const ServicesPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ImmigrationPage()));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/categories/immigration.png',
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color.fromRGBO(19, 38, 63, 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Immigration'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              letterSpacing: 1),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Specialists in immigration law for Expats and Non-Residents',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                            textAlign: TextAlign.center,
                                          ),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BusinessMainPage()));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/categories/business.png',
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Color.fromRGBO(19, 38, 63, 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Business'.toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              letterSpacing: 1),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempor nunc urna, eget aliquam ex convallis vitae.',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200),
                                            textAlign: TextAlign.center,
                                          ),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/categories/nationality.png',
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Color.fromRGBO(19, 38, 63, 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Nationality & Citizenship'
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            letterSpacing: 1),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200),
                                          textAlign: TextAlign.center,
                                        ),
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
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/categories/mobility.png',
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Color.fromRGBO(19, 38, 63, 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Global Mobility'.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            letterSpacing: 1),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w200),
                                          textAlign: TextAlign.center,
                                        ),
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
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
