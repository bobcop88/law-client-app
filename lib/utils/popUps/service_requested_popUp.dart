import 'package:flutter/material.dart';
import 'package:new_client_app/pages/app_pages/services/services_pending/pending_service_page.dart';

class PopUps {
  requestSentPopUp(context, serviceName, user) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Column(
              children: const [
                Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(250, 169, 22, 1),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Your request has been sent',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ServicePendingPage(
                                serviceName: serviceName,
                                userId: user,
                              )));
                    },
                    child: const Text('Go to Service'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
