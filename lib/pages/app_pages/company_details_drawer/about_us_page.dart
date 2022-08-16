import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('About us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: const AssetImage(
                                'assets/images/business_2.png')),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.accessibility,
                            color: Color.fromRGBO(250, 169, 22, 1),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Company Name',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tristique eleifend dui, ac iaculis erat rutrum vel. Duis aliquam consequat urna, eu imperdiet lacus egestas ac.',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.assignment_turned_in,
                            color: Color.fromRGBO(250, 169, 22, 1),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Contacts',
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.local_phone,
                              color: Color.fromRGBO(250, 169, 22, 1), size: 18),
                          const SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                              onTap: () =>
                                  launchUrl(Uri(scheme: 'tel', path: '123456')),
                              child: Text('+123456789')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.email,
                              color: Color.fromRGBO(250, 169, 22, 1), size: 18),
                          const SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                              onTap: () => launchUrl(Uri(
                                  scheme: 'mailto',
                                  path: 'inscale@inscale.com')),
                              child: Text('inscale@inscale.com'))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.location_on,
                              color: Color.fromRGBO(250, 169, 22, 1), size: 18),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () => launchUrl(
                                Uri(scheme: 'https', path: 'inscalemedia.com'),
                                mode: LaunchMode.externalApplication),
                            child: Text(
                                '25 Example Street, 00000 London, England'),
                          ))
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
    );
  }
}
