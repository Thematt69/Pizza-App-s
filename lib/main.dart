import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pizza_app_s/blocs/bloc_provider.dart';
import 'package:pizza_app_s/blocs/store_bloc.dart';
import 'package:pizza_app_s/pages/welcome_page.dart';
import 'package:pizza_app_s/theme.dart';
import 'package:pizza_app_s/widgets/custom_builder.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setPathUrlStrategy();

  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

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
        return BlocProvider<BlocBase>(
          key: GlobalKey(),
          blocs: [
            StoreBloc(),
          ],
          child: MaterialApp(
            title: "Pizza App's",
            themeMode: ThemeMode.dark,
            darkTheme: CustomTheme.darkTheme,
            home: const WelcomePage(),
          ),
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
