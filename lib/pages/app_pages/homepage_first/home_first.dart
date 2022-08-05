import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/homepage_first/widgets/categories_scrolling.dart';
import 'package:new_client_app/pages/app_pages/homepage_first/widgets/news_scrolling.dart';
import 'package:new_client_app/pages/app_pages/homepage_first/widgets/team_scrolling.dart';
import 'package:new_client_app/pages/app_pages/services/immigration/eu_visa_page.dart';
import 'package:new_client_app/pages/app_pages/services/immigration/immigration_page.dart';
import 'package:new_client_app/utils/errors/error_service_exists.dart';
import 'package:new_client_app/utils/services/database_services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeFirst extends StatefulWidget {
  final PageController controller;
  const HomeFirst({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeFirst> createState() => _HomeFirstState();
}

class _HomeFirstState extends State<HomeFirst> {
  int activeIndex = 0;
  final urlImages = [
    'assets/slider_home/Slider1.png',
    'assets/slider_home/Slider2.png',
    'assets/slider_home/Slider3.png',
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!.uid;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: urlImages.length,
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  buildIndicator(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Top Services',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
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
                        child: Container(
                          height: 65,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(103, 108, 122, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 15.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Image.asset(
                                      'assets/icons/EUVisas-TopServices.png',
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Eu Visa',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(196, 194, 194, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 15.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.asset(
                                    'assets/icons/Fiscal-TopServices.png',
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Fiscal',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 169, 22, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 15.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.asset(
                                    'assets/icons/Relocation-TopServices.png',
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Relocation',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(19, 38, 63, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 15.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.asset(
                                    'assets/icons/Litigation-TopServices.png',
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Litigation',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          categoriesScrolling(context),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: const [
          //           Text(
          //             'Categories',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 15.0,
          //       ),
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         child: Row(
          //           children: [
          //             GestureDetector(
          //               onTap: () {
          //                 Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => const ImmigrationPage()));
          //               },
          //               child: Container(
          //                 height: 150,
          //                 width: 150,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(20),
          //                   image: DecorationImage(
          //                       image: const AssetImage(
          //                           'assets/images/immigration.jpg'),
          //                       fit: BoxFit.cover,
          //                       colorFilter: ColorFilter.mode(
          //                           Colors.black.withOpacity(0.3),
          //                           BlendMode.darken)),
          //                 ),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: const [
          //                     Text(
          //                       'Immigration',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20.0,
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 10.0,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(width: 10.0),
          //             Container(
          //               height: 150,
          //               width: 150,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 image: DecorationImage(
          //                     image: const AssetImage(
          //                         'assets/images/business.jpg'),
          //                     fit: BoxFit.cover,
          //                     colorFilter: ColorFilter.mode(
          //                         Colors.black.withOpacity(0.3),
          //                         BlendMode.darken)),
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: const [
          //                   Text(
          //                     'Business',
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10.0,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(width: 10.0),
          //             Container(
          //               height: 150,
          //               width: 150,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 image: DecorationImage(
          //                     image: const AssetImage(
          //                         'assets/images/mobility.jpg'),
          //                     fit: BoxFit.cover,
          //                     colorFilter: ColorFilter.mode(
          //                         Colors.black.withOpacity(0.3),
          //                         BlendMode.darken)),
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: const [
          //                   Text(
          //                     'Mobility',
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 10.0,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(width: 10.0),
          //             Container(
          //               height: 150,
          //               width: 150,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 image: DecorationImage(
          //                     image: const AssetImage(
          //                         'assets/images/passport_img.jpg'),
          //                     fit: BoxFit.cover,
          //                     colorFilter: ColorFilter.mode(
          //                         Colors.black.withOpacity(0.3),
          //                         BlendMode.darken)),
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: const [
          //                   Text(
          //                     'Nationality & Citizenship',
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 20.0,
          //                     ),
          //                     textAlign: TextAlign.center,
          //                   ),
          //                   SizedBox(
          //                     height: 10.0,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'The Team',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                teamScrolling(context),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'News',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                newsScrolling(context),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          urlImage,
          width: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: Color.fromRGBO(250, 169, 22, 1),
            dotHeight: 10.0,
            dotWidth: 10.0),
        activeIndex: activeIndex,
        count: urlImages.length);
  }
}
