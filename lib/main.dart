import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pizza_app_s/my_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setPathUrlStrategy();
  
  runApp(const MyApp());
}
