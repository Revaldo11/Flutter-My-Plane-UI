import 'package:flutter/material.dart';
import 'package:my_plane/components/pages/bonus_page.dart';
import 'package:my_plane/components/pages/main_page.dart';
import 'package:my_plane/components/pages/sign_up_page.dart';

import 'components/pages/get_started_page.dart';
import 'components/pages/spalsh_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/get-started': (context) => const GetStartedPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/bonus': (context) => const BonusPage(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}
