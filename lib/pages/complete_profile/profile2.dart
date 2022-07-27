import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_client_app/pages/complete_profile/list_countries/country_class.dart';
import 'package:new_client_app/pages/complete_profile/profile_class.dart';
import 'package:new_client_app/pages/homepage/home_page.dart';
import 'package:new_client_app/utils/errors/error_dialog.dart';
import 'package:new_client_app/utils/users/database_users.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTwo extends StatefulWidget {
  final PageController controller;
  const ProfileTwo({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProfileTwo> createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  final TextEditingController _documentNumber = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _nationality = TextEditingController();
  var dateOfBirthValue = 0;
  // final email = FirebaseAuth.instance.currentUser!.email;
  // final userId = FirebaseAuth.instance.currentUser!.uid;

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
              width: 150.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              AppLocalizations.of(context)!.profile2_title,
              style: const TextStyle(
                color: Color.fromRGBO(15, 48, 65, 1),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
              indent: 100.0,
              endIndent: 100.0,
              height: 50.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                readOnly: true,
                controller: _dateOfBirthController,
                keyboardType: TextInputType.none,
                // textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.profile2_dob),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: AppLocalizations.of(context)!.profile2_enter_dob,
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
                onTap: () {
                  // FocusScope.of(context).unfocus();
                  _selectDOB();
                  getDeviceToken();
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _nationality,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.profile2_country),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText:
                      AppLocalizations.of(context)!.profile2_enter_country,
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
                onTap: () {
                  _showCountries();
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _documentNumber,
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.profile2_id),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: AppLocalizations.of(context)!.profile2_enter_id,
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
              height: 50.0,
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
                          onPressed: () {
                            if (dateOfBirthValue == 0 ||
                                _nationality.text.isEmpty ||
                                _documentNumber.text.isEmpty) {
                              ErrorDialog().errorFieldMissing(context);
                            } else {
                              completeProfile();
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .profile2_finish_btn,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
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
    );
  }

  Future _selectDOB() async {
    FocusScope.of(context).unfocus();

    final dateOfBirth = await showDatePicker(
        context: context,
        initialDate: DateTime(1980, 01, 01),
        firstDate: DateTime(1900, 01, 01),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary:
                      Color.fromRGBO(15, 48, 65, 1), // header background color
                  onPrimary:
                      Color.fromARGB(255, 247, 247, 247), // header text color
                  onSurface: Colors.black, // body text color
                ),
                scaffoldBackgroundColor: Colors.white,
              ),
              child: child!);
        });

    if (dateOfBirth != null) {
      FocusScope.of(context).unfocus();
      final selectedDOB = DateFormat('dd/MM/yyyy').format(dateOfBirth);
      dateOfBirthValue = dateOfBirth.millisecondsSinceEpoch;
      setState(() {
        _dateOfBirthController.value = TextEditingValue(text: selectedDOB);
      });
    }
  }

  _showCountries() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), side: BorderSide.none),
            backgroundColor: Colors.white,
            title: Text(
              AppLocalizations.of(context)!.profile2_select_country_title,
              style: const TextStyle(
                  color: Color.fromRGBO(15, 48, 65, 1),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 500.0,
                width: 300.0,
                child: FutureBuilder<List<Country>>(
                    future: CountryList.getCountries(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                            thickness: 1,
                            color: Color.fromRGBO(15, 48, 65, 1),
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return SimpleDialogOption(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data![index].flag ?? '',
                                    style: const TextStyle(
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                        fontSize: 17.0,
                                        // color: Color.fromRGBO(253, 69, 77, 1),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                _nationality.value = TextEditingValue(
                                    text: snapshot.data![index].name);
                                FocusScope.of(context).unfocus();
                              },
                            );
                          },
                        );
                      }
                    }),
              ),
            ],
          );
        });
  }

  Future completeProfile() async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;

      await DatabaseUsers(uid: id).completeUserProfile(
        ProfileDatas.firstName!,
        ProfileDatas.lastName!,
        dateOfBirthValue,
        _nationality.text,
        _documentNumber.text,
        ProfileDatas.phoneNumber!,
        ProfileDatas.token!,
      );
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future getDeviceToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        ProfileDatas.token = token;
      });
    });
  }
}
