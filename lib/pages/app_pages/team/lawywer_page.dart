import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LawyerPage extends StatefulWidget {
  const LawyerPage({Key? key}) : super(key: key);

  @override
  State<LawyerPage> createState() => _LawyerPageState();
}

class _LawyerPageState extends State<LawyerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        elevation: 0,
        title: const Text('Lesley Roman'),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/team/team_1.png')),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  Expanded(
                    child: Container(
                      // height: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Lesley Roman',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.store,
                                  color: Color.fromRGBO(250, 169, 22, 1),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  'Immigration',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                                VerticalDivider(),
                                Icon(
                                  Icons.flag,
                                  color: Color.fromRGBO(250, 169, 22, 1),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  'Nationality',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempor nunc urna, eget aliquam ex convallis vitae. Nullam turpis dolor, auctor vitae orci quis, aliquam volutpat purus. Nulla tristique semper metus, id pellentesque quam volutpat vitae.',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 20.0,
                              endIndent: 200,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Contacts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.local_phone,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 16),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                GestureDetector(
                                    onTap: () => launchUrl(
                                        Uri(scheme: 'tel', path: '123456')),
                                    child: const Text(
                                      '+123456789',
                                      style: TextStyle(fontSize: 12.0),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.email,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 16),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                GestureDetector(
                                    onTap: () => launchUrl(Uri(
                                        scheme: 'mailto',
                                        path: 'inscale@inscale.com')),
                                    child: const Text('inscale@inscale.com',
                                        style: TextStyle(fontSize: 12.0)))
                              ],
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Color.fromRGBO(250, 169, 22, 1),
                                    size: 16),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () => launchUrl(
                                      Uri(
                                          scheme: 'https',
                                          path: 'inscalemedia.com'),
                                      mode: LaunchMode.externalApplication),
                                  child: const Text(
                                      '25 Example Street, 00000 London, England',
                                      style: TextStyle(fontSize: 12.0)),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
