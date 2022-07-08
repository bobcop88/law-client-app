import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/immigration_page.dart';

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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                            const Color.fromRGBO(15, 48, 65, 1)
                                .withOpacity(0.7),
                            BlendMode.darken),
                        image: const AssetImage(
                            'assets/images/immigration_2.png')),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'IMMIGRATION',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.white,
                        indent: 150,
                        endIndent: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque viverra nulla non faucibus elementum. In vel pharetra justo. Proin ornare risus felis, in eleifend lorem fringilla vel. ',
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => ImmigrationPage())));
                        },
                        child: Text('Immigration services'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                            const Color.fromRGBO(15, 48, 65, 1)
                                .withOpacity(0.7),
                            BlendMode.darken),
                        image:
                            const AssetImage('assets/images/mobility_2.png')),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GLOBAL MOBILITY',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.white,
                        indent: 150,
                        endIndent: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque viverra nulla non faucibus elementum. In vel pharetra justo. Proin ornare risus felis, in eleifend lorem fringilla vel. ',
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Global Mobility'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                            const Color.fromRGBO(15, 48, 65, 1)
                                .withOpacity(0.7),
                            BlendMode.darken),
                        image: const AssetImage(
                            'assets/images/nationality_2.png')),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NATIONALITY & CITIZENSHIP',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.white,
                        indent: 150,
                        endIndent: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque viverra nulla non faucibus elementum. In vel pharetra justo. Proin ornare risus felis, in eleifend lorem fringilla vel. ',
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Nationality & Citizenship'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                            const Color.fromRGBO(15, 48, 65, 1)
                                .withOpacity(0.7),
                            BlendMode.darken),
                        image:
                            const AssetImage('assets/images/business_2.png')),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BUSINESS',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 3,
                        color: Colors.white,
                        indent: 150,
                        endIndent: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque viverra nulla non faucibus elementum. In vel pharetra justo. Proin ornare risus felis, in eleifend lorem fringilla vel. ',
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Business'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
