import 'package:flutter/material.dart';

class TermsConditionsPageRegister extends StatefulWidget {
  const TermsConditionsPageRegister({Key? key}) : super(key: key);

  @override
  State<TermsConditionsPageRegister> createState() =>
      _TermsConditionsPageRegisterState();
}

class _TermsConditionsPageRegisterState
    extends State<TermsConditionsPageRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(15, 48, 65, 1),
        title: const Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.library_books_outlined,
                            color: Color.fromRGBO(250, 169, 22, 1),
                            size: 18.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Terms & Conditions',
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
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus hendrerit mauris id erat aliquet, ac convallis lectus hendrerit. Duis sed dui vel odio dignissim feugiat vitae a metus. Ut volutpat, metus id laoreet efficitur, velit lectus pharetra ligula, ac commodo ligula orci a risus. Nullam imperdiet lacus a bibendum tristique. Nullam tristique congue tincidunt. Duis feugiat, erat nec imperdiet posuere, justo nibh ultricies purus, quis volutpat elit nisl non lorem. Fusce consequat pharetra condimentum. Donec congue, nisl at condimentum aliquam, tortor risus convallis justo, quis sodales lectus enim blandit odio. In aliquam odio semper lectus maximus sodales. Integer tortor diam, placerat at risus quis, posuere suscipit nisi. Proin elit turpis, semper bibendum hendrerit eu, pharetra ut metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi sed nisl et risus venenatis posuere ut non lorem. Suspendisse non nisi interdum, imperdiet ipsum at, ornare neque. Phasellus nec dolor interdum, bibendum nisl in, vehicula sapien. Donec a tempor tellus.',
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
            ],
          ),
        ),
      ),
    );
  }
}
