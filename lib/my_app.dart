import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pizza_app_s/my_home_page.dart';
import 'package:pizza_app_s/theme.dart';
import 'package:pizza_app_s/widgets/custom_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> _init() async {
    try {
      await Firebase.initializeApp();

      await FirebaseAuth.instance.signInAnonymously();

      FlutterNativeSplash.remove();

      return true;
    } catch (e) {
      debugPrint('MyApp ERROR : $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<bool>(
      future: _init(),
      dataBuilder: (context, data) {
        return MaterialApp(
          title: "Pizza App's",
          themeMode: ThemeMode.dark,
          darkTheme: CustomTheme.darkTheme,
          home: const MyHomePage(),
        );
      },
      waitingBuilder: () => MaterialApp(
        title: "Pizza App's",
        themeMode: ThemeMode.dark,
        darkTheme: CustomTheme.darkTheme,
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      errorBuilder: (error, stackTrace) {
        debugPrint('error => $error');
        return MaterialApp(
          title: "Pizza App's",
          themeMode: ThemeMode.dark,
          darkTheme: CustomTheme.darkTheme,
          home: const Scaffold(
            body: Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
