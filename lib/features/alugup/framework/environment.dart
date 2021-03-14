import 'dart:async';
import 'package:flutter/widgets.dart';

enum EnvironmentType { DEVELOPMENT, STAGING, PRODUCTION, TESTING, STATIC }

class Environment {
  static Environment current;

  String appName;
  String baseUrl;
  String apiKey;

  EnvironmentType environmentType = EnvironmentType.DEVELOPMENT;

  Environment() {
    current = this;
    _init();
  }

  @protected
  dynamic createApplication() {
    return Null;
  }

  @protected
  dynamic createMainWidget(dynamic application) {
    return Null;
  }

  void _init() async {
    var application = createApplication();
    var widget = createMainWidget(application);

    runZoned<Future<void>>(
      () async {
        await application.initialize();

        runApp(
          widget
        );
      },
    );
  }
}
