import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_client_app/main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    children: const [
                      Text(
                        'Forgot\nPassword?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 5,
                  indent: 15.0,
                  endIndent: 250.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    color: const Color.fromARGB(183, 0, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: Text(
                                  'Don\u0027t worry! Please enter the email address linked to your account. You\u0027ll receive an email to reset your password ',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(183, 0, 0, 0),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              labelText: 'Email Address',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                              ),
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid email address'
                                    : null,
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: TextFormField(
                          //           controller: emailController,
                          //           textInputAction: TextInputAction.next,
                          //           decoration: InputDecoration(
                          //             labelText: 'Enter your Email address'
                          //           ),
                          //           autovalidateMode: AutovalidateMode.onUserInteraction,
                          //           validator: (email) =>
                          //             email != null && !EmailValidator.validate(email)
                          //             ? 'Enter a valid email address'
                          //             : null
                          //             ,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     ElevatedButton(
                          //       onPressed: resetPassword,
                          //       child: Text(
                          //         'Reset Password'
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: resetPassword,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      final snackBar = const SnackBar(
        content: Text('Reset Password email has been sent'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
          backgroundColor: Colors.black,
        ),
      );
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
