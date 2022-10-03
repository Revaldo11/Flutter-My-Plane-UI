import 'package:flutter/material.dart';

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
      },
    );
  }
}
