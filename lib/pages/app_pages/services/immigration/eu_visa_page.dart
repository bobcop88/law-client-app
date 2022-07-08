import 'package:flutter/material.dart';

class EuVisaPage extends StatefulWidget {
  const EuVisaPage({Key? key}) : super(key: key);

  @override
  State<EuVisaPage> createState() => _EuVisaPageState();
}

class _EuVisaPageState extends State<EuVisaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('EU Visa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EU visa',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(15, 48, 65, 1)),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris fermentum justo turpis, consequat mollis ex congue ut. Nam sagittis lacinia ipsum, id semper tellus.',
                    style: TextStyle(fontSize: 12.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  'Requirements',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 48, 65, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sufficient economic resources',
                      ),
                      Text(
                        'This can be demonstrated in various ways for example payslips or bank statements',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                visualDensity: VisualDensity.compact),
                            child: Text('Upload'),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'No document uploaded',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Empadronamiento',
                      ),
                      Text(
                        'Proof of your place of residence in Spain',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Upload'),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'No document uploaded',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
