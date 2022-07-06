import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_client_app/main.dart';
import 'package:new_client_app/pages/login_page/login_page.dart';
import 'package:new_client_app/pages/register_page/verify_email_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                        AppLocalizations.of(context)!.register_page_title,
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
                  Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color.fromRGBO(15, 48, 65, 1),
                            ),
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(15, 48, 65, 1),
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
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
                                  color: Color.fromRGBO(15, 48, 65, 1),
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
                              // fontSize: 17.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email address'
                                  : null,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(15, 48, 65, 1),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(15, 48, 65, 1),
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                            suffix: InkWell(
                              onTap: _showPassword,
                              child: Icon(
                                _hidePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 15.0,
                                color: Color.fromRGBO(15, 48, 65, 1),
                              ),
                            ),
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
                                  color: Color.fromRGBO(15, 48, 65, 1),
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
                          ),
                          style: TextStyle(
                              color: Color.fromRGBO(15, 48, 65, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: _hidePassword,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Enter min. 6 characters'
                                  : null,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                            controller: passwordConfirmationController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromRGBO(15, 48, 65, 1),
                              ),
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(15, 48, 65, 1),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
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
                                    color: Color.fromRGBO(15, 48, 65, 1),
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
                            ),
                            style: TextStyle(
                                color: Color.fromRGBO(15, 48, 65, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                            validator: (value) => value != null &&
                                    value != passwordController.text
                                ? 'Password not matching. Please retry'
                                : null),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: signUp,
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(15)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                child: Text(
                                  AppLocalizations.of(context)!.sp_register_btn,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .register_page_already_registered,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 48, 65, 1)),
                            ),
                            TextButton(
                              child: Text(
                                AppLocalizations.of(context)!.sp_login_btn,
                                style: TextStyle(
                                  color: Color.fromRGBO(15, 48, 65, 1),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => LoginPage())));
                              },
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

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      User? user = result.user;
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message.toString()),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => VerifyEmailPage()));
  }
}
