import 'dart:convert';
import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/auth/register.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Login",
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OwTextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              labelText: "Email"
            ),
            SizedBox(height: 15),
            OwTextField(
              controller: senha,
              labelText: "Senha",
              obscureText: true,
            ),
            SizedBox(height: 15),
            OwButton(
              onPressed: () async {
                OwToast.loading();
                try {
                  http.Response response = await http.post("https://matheussanches.wixsite.com/mysite-10/_functions/login",
                    headers: {
                      'Content-Type': 'application/json'
                    },
                    body: jsonEncode({
                      "email": email.text,
                      "senha": senha.text
                    })
                  );
                  OwToast.close();
                  if (response.body.isNotEmpty) {
                    if(json.decode(response.body)["code"] == "200") {
                      dados2 = json.decode(response.body)["resultado"]["items"][0];
                      OwRouter.rightToLeft(context, AlugUpHome());
                    } else {
                      BotToast.showNotification(
                        title: (_) {
                          return Text("Usuario nao encontrado");
                        }
                      );
                    }
                    return json.decode(response.body);
                  }
                  else return MAP_ERRO_API;
                } catch (e) {
                  return MAP_ERRO_API;
                }
              },
              labelText: "Entrar",
            ),
            SizedBox(height: 15),
            OwButton.outline(
              onPressed: () {
                OwRouter.rightToLeft(context, Cadastro());
              }, 
              labelText: "Criar conta",
            )
          ],
        ),
      ),
    );
  }
}