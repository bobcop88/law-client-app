import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:new_client_app/main.dart';
import 'package:new_client_app/pages/homepage/home_page.dart';
import 'package:new_client_app/pages/register_page/forgot_password_page.dart';
import 'package:new_client_app/pages/register_page/register.dart';
import 'package:new_client_app/utils/users/database_users.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var _hidePassword = true;
  String deviceToken = '';

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: [Expanded(child: Image.asset('assets/logo.png'))],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
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
                              'Sign In Now',
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
                                  'Please enter your information below in order to login to your account',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
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
                        TextField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
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
                                  // width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  // width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          style: const TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              // fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 20.0,
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
                        TextField(
                          controller: passwordController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
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
                                // size: 17.0,
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
                          ),
                          obscureText: _hidePassword,
                          style: const TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              // fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              },
                              child: const Text(
                                'Forgot your password?',
                                style: TextStyle(
                                  color: Colors.black,
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
                                onPressed: signIn,
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(15)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 10.0,),

                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\u0027t have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                              },
                              style: const ButtonStyle(
                                  visualDensity: VisualDensity.compact),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .loginp_register_now,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );
    getDeviceToken();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      DatabaseUsers(uid: FirebaseAuth.instance.currentUser!.uid)
          .updateDeviceToken(deviceToken);
      // print(FirebaseAuth.instance.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.code == 'user-not-found'
            ? 'The username entered does not exist'
            : e.code == 'wrong-password'
                ? 'The password entered is not correct, please try again'
                : 'Your username or password are not valid. Please try again or register a new account'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void _showPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  Future getDeviceToken() async {
    return await FirebaseMessaging.instance.getToken().then((token) {
      // print(token);
      setState(() {
        deviceToken = token!;
      });
    });
  }
}

//yellow Color.fromRGBO(250, 169, 22, 1)