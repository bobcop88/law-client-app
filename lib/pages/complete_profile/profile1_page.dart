import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/pages/complete_profile/profile_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileOne extends StatefulWidget {
  final PageController controller;
  const ProfileOne({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProfileOne> createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              const Image(
                image: AssetImage('assets/details.png'),
                // height: 100.0,
                width: 150.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.profile1_title,
                      style: const TextStyle(
                          color: Color.fromRGBO(15, 48, 65, 1),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.profile1_name),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    hintText: AppLocalizations.of(context)!.profile1_enter_name,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(15, 48, 65, 1),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(15, 48, 65, 1),
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
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.profile1_surname),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    hintText:
                        AppLocalizations.of(context)!.profile1_enter_surname,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(15, 48, 65, 1),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(15, 48, 65, 1),
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
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.profile1_phone),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    hintText:
                        AppLocalizations.of(context)!.profile1_enter_phone,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(15, 48, 65, 1),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(15, 48, 65, 1),
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
                            // style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all(
                            //         const Color.fromRGBO(253, 69, 77, 1))),
                            onPressed: () {
                              widget.controller.jumpToPage(2);
                              // duration: const Duration(seconds: 1),
                              // curve: Curves.easeIn);

                              ProfileDatas.firstName = _firstName.text;
                              ProfileDatas.lastName = _lastName.text;
                              ProfileDatas.phoneNumber = _phoneNumber.text;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .profile1_continue_btn,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const Icon(Icons.arrow_forward_rounded),
                              ],
                            ),
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
      ),
    );
  }
}
