import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_client_app/utils/logs/database_logs.dart';

class WelcomePageProfile extends StatefulWidget {
  final PageController controller;
  const WelcomePageProfile({Key? key, required this.controller})
      : super(key: key);

  @override
  State<WelcomePageProfile> createState() => _WelcomePageProfileState();
}

class _WelcomePageProfileState extends State<WelcomePageProfile> {
  String user = FirebaseAuth.instance.currentUser!.uid;
  String email = FirebaseAuth.instance.currentUser!.email!;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/welcome_image.png'),
                    height: 250.0,
                    width: 250.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.welcome_profile_title,
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Company Name',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 20.0,),
              const Divider(
                thickness: 3,
                color: Colors.black,
                indent: 100.0,
                endIndent: 100.0,
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.welcome_profile_subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                child: Text(
                  AppLocalizations.of(context)!.welcome_profile_btn,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                // style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(
                //         const Color.fromRGBO(253, 69, 77, 1))),
                onPressed: () {
                  widget.controller.animateToPage(1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                  DatabaseLogUser().createLogUser(
                      user, 'client', email, 'Email Verified', 'Registration');
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
