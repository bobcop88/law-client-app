import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/pages/complete_profile/profile_class.dart';

class ProfileOne extends StatefulWidget {
  final PageController controller;
  const ProfileOne({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProfileOne> createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _documentNumber = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _nationality = TextEditingController();
  var dateOfBirthValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const Image(
              image: AssetImage('assets/details.png'),
              height: 100.0,
              width: 100.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Complete your Personal Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
              indent: 100.0,
              endIndent: 100.0,
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _firstName,
                decoration: const InputDecoration(
                  label: Text('Name'),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintText: 'Enter your Name',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(253, 69, 77, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(253, 69, 77, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _lastName,
                decoration: const InputDecoration(
                  label: Text('Surname'),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintText: 'Enter your Surname',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(253, 69, 77, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(253, 69, 77, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _phoneNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Phone Number'),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintText: 'Please enter your Phone Number',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(253, 69, 77, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(253, 69, 77, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            const SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(Icons.arrow_forward_rounded),
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(253, 69, 77, 1))),
                          onPressed: () {
                            widget.controller.animateToPage(2,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);

                            ProfileDatas.firstName = _firstName.text;
                            ProfileDatas.lastName = _lastName.text;
                            ProfileDatas.phoneNumber = _phoneNumber.text;
                          },
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
    );
  }
}
