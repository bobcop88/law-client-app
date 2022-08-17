import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/news/news_details_page.dart';

Widget newsScrolling(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NewsPage()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/images/News1.jpg'),
                  fit: BoxFit.cover),
            ),
            width: 250,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(15, 48, 65, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Nuevo estado de alarma'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'All you need to know',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10.0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/images/News2.jpg'),
                fit: BoxFit.cover),
          ),
          width: 250,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(15, 48, 65, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Nuevo estado de alarma'.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'All you need to know',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/slider_home/slider_3.png'),
                fit: BoxFit.cover),
          ),
          width: 250,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(15, 48, 65, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Nuevo estado de alarma'.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12.0),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'All you need to know',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
