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
                          style: const TextStyle(
                              color: const Color.fromRGBO(15, 48, 65, 1),
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
                          style: const TextStyle(
                              color: const Color.fromRGBO(15, 48, 65, 1),
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
                Container(
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
        ],
      ),
    );
  }
}
