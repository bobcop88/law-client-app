import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_client_app/main.dart';
import 'package:new_client_app/pages/homepage/home_page.dart';
import 'package:new_client_app/pages/register_page/forgot_password_page.dart';
import 'package:new_client_app/pages/register_page/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/img_start_page.png',
              ),
              fit: BoxFit.cover,
              opacity: 0.2,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.loginp_title,
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(15, 48, 65, 1),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 5.0,
                    color: Color.fromRGBO(15, 48, 65, 1),
                    endIndent: 200,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(15, 48, 65, 1),
                          ),
                          labelText: AppLocalizations.of(context)!.loginp_email,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
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
                                color: Color.fromRGBO(15, 48, 65, 1),
                                width: 1.0,
                                style: BorderStyle.solid),
                          ),
                        ),
                        style: const TextStyle(
                            color: Color.fromRGBO(15, 48, 65, 1),
                            // fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromRGBO(15, 48, 65, 1),
                          ),
                          labelText:
                              AppLocalizations.of(context)!.loginp_password,
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                          suffix: InkWell(
                            onTap: _showPassword,
                            child: Icon(
                              _hidePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 17.0,
                              color: const Color.fromRGBO(15, 48, 65, 1),
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
                                color: Color.fromRGBO(15, 48, 65, 1),
                                width: 1.0,
                                style: BorderStyle.solid),
                          ),
                        ),
                        obscureText: _hidePassword,
                        style: const TextStyle(
                            color: Color.fromRGBO(15, 48, 65, 1),
                            // fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      const SizedBox(
                        height: 50.0,
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
                              child: Text(
                                AppLocalizations.of(context)!.sp_login_btn,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10.0,),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.loginp_forgot_password,
                          style: const TextStyle(
                            color: Color.fromRGBO(200, 36, 47, 1),
                            fontSize: 17.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: Color.fromRGBO(200, 36, 47, 1))),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.loginp_register_now,
                              style: const TextStyle(
                                color: Color.fromRGBO(200, 36, 47, 1),
                                // fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message.toString()),
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
}
