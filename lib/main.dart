import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_plane/components/pages/bonus_page.dart';
import 'package:my_plane/components/pages/main_page.dart';
import 'package:my_plane/components/pages/sign_in_page.dart';
import 'package:my_plane/components/pages/sign_up_page.dart';
import 'package:my_plane/components/pages/succes_page.dart';
import 'package:my_plane/cubit/auth_cubit.dart';
import 'package:my_plane/cubit/destination_cubit.dart';
import 'package:my_plane/cubit/page_cubit.dart';
import 'package:my_plane/cubit/seat_cubit.dart';
import 'package:my_plane/cubit/transaction_cubit.dart';

import 'components/pages/get_started_page.dart';
import 'components/pages/spalsh_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDciwklZvSoV2iF-B_3a99i2O506ReH4Is",
          appId: "1:592804202427:android:aac768513528d420ffe69e",
          projectId: 'air-plane-4c825',
          messagingSenderId: ''));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAndroidTheme = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _fetchRemoteConfig();
  }

  Future<void> _fetchRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: Duration(seconds: 10),
    minimumFetchInterval: Duration.zero, // penting! agar selalu ambil terbaru
  ));

  await remoteConfig.setDefaults({'enable_android_theme': false});
  print('Firebase Remote Config ID: ${remoteConfig.getAll().toString()}');


  try {
    await remoteConfig.fetchAndActivate();
    final isAndroidTheme = Platform.isAndroid
        ? remoteConfig.getBool('enable_android_theme')
        : false;

    setState(() {
      _isAndroidTheme = isAndroidTheme;
      _loaded = true;
    });
  } catch (e) {
    print('Remote Config fetch error: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    analytics.logEvent(name: 'home_page_opened');
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) => PageCubit()),
    //     BlocProvider(create: (context) => AuthCubit()),
    //     BlocProvider(create: (context) => DestinationCubit()),
    //     BlocProvider(create: (context) => SeatCubit()),
    //     BlocProvider(create: (context) => TransactionCubit()),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     // routes: {
    //     //   '/': (context) => const SplashScreen(),
    //     //   '/get-started': (context) => const GetStartedPage(),
    //     //   '/sign-up': (context) => SignUpPage(),
    //     //   '/sign-in': (context) => SignInPage(),
    //     //   '/bonus': (context) => const BonusPage(),
    //     //   '/main': (context) => const MainPage(),
    //     //   '/success': (context) => const SuccesPage(),
    //     // },
    //     theme: _darkModeEnabled ? ThemeData.dark() : ThemeData.light(),
    //     home: Scaffold(
    //       appBar: AppBar(title: Text('Remote Config Demo')),
    //       body: Center(
    //         child: Text(
    //           _darkModeEnabled ? 'Dark Mode Enabled' : 'Light Mode Enabled',
    //           style: TextStyle(fontSize: 24),
    //         ),
    //       ),
    //     ),

    //   ),
    // );
    if (!_loaded) {
      return MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
    }

    final ThemeData theme = _isAndroidTheme
        ? ThemeData(primarySwatch: Colors.deepOrange, brightness: Brightness.dark)
        : ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light);

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(title: Text("Platform-Based Theme")),
        body: Center(
          child: Text(
            _isAndroidTheme ? "Tema Android Aktif" : "Tema Default",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;

  const HomePage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Config Theme Demo"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black54 : Colors.yellow[100],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDarkMode ? Colors.white54 : Colors.black,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                size: 80,
                color: isDarkMode ? Colors.white : Colors.orange,
              ),
              SizedBox(height: 16),
              Text(
                isDarkMode ? "Dark Mode Aktif" : "Light Mode Aktif",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Tema ini diatur oleh Firebase Remote Config.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
