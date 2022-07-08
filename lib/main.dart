import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:new_client_app/pages/homepage/home_page.dart';
import 'package:new_client_app/pages/register_page/verify_email_page.dart';
import 'package:new_client_app/pages/start_page/start_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(242, 242, 242, 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(200, 36, 47, 1)),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(15, 48, 65, 1)),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final navigatorKey = GlobalKey<NavigatorState>();

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final isEmailVerified =
                FirebaseAuth.instance.currentUser!.emailVerified;

            return isEmailVerified ? const HomePage() : const VerifyEmailPage();
          } else {
            return const StartPage();
          }
        },
      ),
    );
  }
}
