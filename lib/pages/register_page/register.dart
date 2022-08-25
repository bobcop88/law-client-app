import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_client_app/main.dart';
import 'package:new_client_app/pages/login_page/login_page.dart';
import 'package:new_client_app/pages/register_page/register_terms_page.dart';
import 'package:new_client_app/utils/logs/database_logs.dart';
import 'package:new_client_app/utils/notifications/database_notifications.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final loginFormKey = GlobalKey<FormState>();
  var _hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  bool acceptTerms = false;
  bool termsError = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Image.asset('assets/logo_neu.png'),
                  ))
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Create your Account',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -1),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, left: 50.0, right: 50.0),
                          child: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Please complete with your details to create your account',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Form(
                          key: loginFormKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Email Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Email address',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(15, 48, 65, 1),
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                style: const TextStyle(
                                    color: Color.fromRGBO(15, 48, 65, 1),
                                    fontSize: 14.0),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (email) => email != null &&
                                        !EmailValidator.validate(email)
                                    ? 'Enter a valid email address'
                                    : null,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                controller: passwordController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  isDense: true,
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Password',
                                  suffixIcon: GestureDetector(
                                    onTap: _showPassword,
                                    child: Icon(
                                      _hidePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(15, 48, 65, 1),
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                                style: const TextStyle(
                                    color: Color.fromRGBO(15, 48, 65, 1),
                                    fontSize: 14.0),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: _hidePassword,
                                validator: (value) =>
                                    value != null && value.length < 6
                                        ? 'Enter min. 6 characters'
                                        : null,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Confirm Password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                  controller: passwordConfirmationController,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    hintText: 'Confirm Password',
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(15, 48, 65, 1),
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                  ),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(15, 48, 65, 1),
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: true,
                                  validator: (value) => value != null &&
                                          value != passwordController.text
                                      ? 'Password not matching. Please retry'
                                      : null),
                              // const SizedBox(
                              //   height: 10.0,
                              // ),
                              Row(
                                children: [
                                  Checkbox(
                                    side: const BorderSide(
                                        color: Colors.grey, width: 1),
                                    value: acceptTerms,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        acceptTerms = value!;
                                      });
                                    },
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.comfortable,
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return const Color.fromRGBO(
                                            250, 169, 22, 1);
                                      }
                                      return null;
                                    }),
                                  ),
                                  const Text('I accept '),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              const TermsConditionsPageRegister()));
                                    },
                                    child: const Text(
                                      'Terms and Conditions',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color:
                                              Color.fromRGBO(250, 169, 22, 1)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Visibility(
                                      visible: termsError,
                                      child: Text(
                                        'Please accept Terms and Conditions',
                                        style: TextStyle(
                                          color: Colors.red[700],
                                          fontSize: 12.0,
                                        ),
                                      ),
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
                                    child: ElevatedButton(
                                      onPressed: signUp,
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.all(15)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)))),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .sp_register_btn,
                                        style: const TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .register_page_already_registered,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const LoginPage())));
                                    },
                                    style: const ButtonStyle(
                                        visualDensity: VisualDensity.compact),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .sp_login_btn,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(250, 169, 22, 1),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  Future signUp() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) return;
    if (!acceptTerms) {
      setState(() {
        termsError = true;
      });
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );

    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      User? user = result.user;
      DatabaseLogUser().createLogUser(
          user!.uid,
          'client',
          emailController.text.trim(),
          'Registration with email',
          'Registration');
      await user.sendEmailVerification();
      await FirebaseFirestore.instance
          .collection('clients')
          .doc(user.uid)
          .set({'userCompleted': false, 'id': user.uid, 'email': user.email});
      DatabaseNotificationsUserToAdmin(
              adminUser: 'rVu8FOvKC3aoBcOiq4FKinZY42p1')
          .sendNotificationToAdmin(user.uid, user.email!, user.email!,
              'Registration', 'New Registration - complete profile pending');
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message.toString() ==
                'The email address is already in use by another account.'
            ? 'You have already an account. Please login with your email and password.'
            : e.message.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
