import 'package:alugup/features/alugup/app/alugup_application.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/auth/login.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';


class AlugupWidget extends StatelessWidget {
  final AlugupApplication _application;

  AlugupWidget(this._application);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlugUp',
      builder: BotToastInit(),
      navigatorKey: navigatorKey,
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}