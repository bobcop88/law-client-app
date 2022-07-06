import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    color: Color.fromRGBO(15, 48, 65, 1),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.sp_login_btn,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.sp_register_btn,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromRGBO(200, 36, 47, 1),
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          side: MaterialStateProperty.all(BorderSide(color: Color.fromRGBO(200, 36, 47, 1)))
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.sp_developed
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
    
  }
}