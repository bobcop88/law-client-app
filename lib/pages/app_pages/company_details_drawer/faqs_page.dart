import 'package:flutter/material.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('FAQs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                          image: AssetImage('assets/images/faqs.png')),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.help_outline,
                            color: Color.fromRGBO(250, 169, 22, 1),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Frequently Asked Questions',
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
                        children: const [
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
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                ExpansionTile(
                                  trailing: const Icon(
                                    Icons.add,
                                    size: 18.0,
                                    color: Colors.black,
                                  ),
                                  title: Row(
                                    children: const [
                                      Icon(
                                        Icons.turned_in,
                                        size: 18.0,
                                        color: Color.fromRGBO(250, 169, 22, 1),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('First Question')
                                    ],
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, bottom: 10.0),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tristique eleifend dui, ac iaculis erat rutrum vel. Duis aliquam consequat urna, eu imperdiet lacus egestas ac.',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ExpansionTile(
                                  trailing: const Icon(
                                    Icons.add,
                                    size: 18.0,
                                    color: Colors.black,
                                  ),
                                  title: Row(
                                    children: const [
                                      Icon(
                                        Icons.turned_in,
                                        size: 18.0,
                                        color: Color.fromRGBO(250, 169, 22, 1),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Second Question')
                                    ],
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, bottom: 10.0),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tristique eleifend dui, ac iaculis erat rutrum vel. Duis aliquam consequat urna, eu imperdiet lacus egestas ac.',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ExpansionTile(
                                  trailing: const Icon(
                                    Icons.add,
                                    size: 18.0,
                                    color: Colors.black,
                                  ),
                                  title: Row(
                                    children: const [
                                      Icon(
                                        Icons.turned_in,
                                        size: 18.0,
                                        color: Color.fromRGBO(250, 169, 22, 1),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Third Question')
                                    ],
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, bottom: 10.0),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            child: Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus tristique eleifend dui, ac iaculis erat rutrum vel. Duis aliquam consequat urna, eu imperdiet lacus egestas ac.',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
    );
  }
}
