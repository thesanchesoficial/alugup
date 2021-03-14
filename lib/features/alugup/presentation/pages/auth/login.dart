import 'dart:convert';
import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/auth/register.dart';
import 'package:bot_toast/bot_toast.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0xff66008e),
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Email"
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: senha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha"
              ),
            ),
            SizedBox(height: 15),
            Container(width: MediaQuery.of(context).size.width, height: 60, child: Expanded(child: ElevatedButton(onPressed: () async {
              BotToast.showLoading();
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
                BotToast.closeAllLoading();
                print(response.body);
                if (response.body.isNotEmpty) {
                  if(json.decode(response.body)["code"] == "200") {
                    dados2 = json.decode(response.body)["resultado"]["items"][0];
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AlugUpHome()));
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
                print(e);
                return MAP_ERRO_API;
              }
            }, 
            child: Text("Entrar")))),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width, 
              height: 60, 
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                  }, 
                  child: Text("Criar conta"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}