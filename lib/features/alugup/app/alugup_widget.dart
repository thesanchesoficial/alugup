import 'package:alugup/features/alugup/app/alugup_application.dart';
import 'package:alugup/features/alugup/presentation/pages/auth/login.dart';
import 'package:alugup/features/alugup/theme/app_theme.dart';
import 'package:components_venver/components.dart';
import 'package:components_venver/settings/settings.dart';
import 'package:flutter/material.dart';


class AlugupWidget extends StatelessWidget {
  final AlugupApplication _application;

  AlugupWidget(this._application);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlugUp',
      builder: ComponentsInit(),
      navigatorKey: navigatorGlobalKey,
      home: Login(),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}