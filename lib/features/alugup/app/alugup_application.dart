import 'package:alugup/features/alugup/framework/application.dart';
import 'package:alugup/features/alugup/framework/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class AlugupApplication extends Application {
  @override
  Future<void> initialize() async {
    print("${Environment.current.appName} initializing...");
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    // Enable Firebase Crashytics reporting on release builds only
    if (kReleaseMode) {
      // p("Inicializando Firebase Crashlytics...");
      // await Firebase.initializeApp();

      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }

  }

  @override
  void terminate() {
    print("${Environment.current.appName} terminated.");
  }
}