import 'package:flutter/material.dart';

class WelcomePageProfile extends StatefulWidget {
  final PageController controller;
  const WelcomePageProfile({Key? key, required this.controller})
      : super(key: key);

  @override
  State<WelcomePageProfile> createState() => _WelcomePageProfileState();
}

class _WelcomePageProfileState extends State<WelcomePageProfile> {
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
                children: const [
                  Expanded(
                    child: Text(
                      'Welcome to\nCompany Name',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      'Take just few moments to complete your profile!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                child: const Text(
                  'Start Now',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(253, 69, 77, 1))),
                onPressed: () {
                  widget.controller.animateToPage(1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
