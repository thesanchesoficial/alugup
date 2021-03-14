import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController nome = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController nascimento = TextEditingController();
  TextEditingController cpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff66008e),
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: InputDecoration(
                labelText: "Nome"
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: telefone,
              decoration: InputDecoration(
                labelText: "Telefone"
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: nascimento,
              decoration: InputDecoration(
                labelText: "Nascimento"
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: email,
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
            TextField(
              controller: cpf,
              decoration: InputDecoration(
                labelText: "CPF"
              ),
            ),
            SizedBox(height: 15),
            Container(width: MediaQuery.of(context).size.width, height: 60, child: Expanded(child: ElevatedButton(onPressed: () async {
              if(email.text.length > 4 && senha.text.length > 4 && nome.text.length > 4 && telefone.text.length > 4 && nascimento.text.length > 4 && cpf.text.length > 4) {
                BotToast.showLoading();
                try {
                  http.Response response = await http.post("https://matheussanches.wixsite.com/mysite-10/_functions/usuario",
                    headers: {
                      'Content-Type': 'application/json'
                    },
                    body: jsonEncode({
                      "email": email.text,
                      "senha": senha.text,
                      "nome": nome.text,
                      "telefone": telefone.text,
                      "nascimento": nascimento.text,
                      "cpf": cpf.text
                    })
                  );
                  BotToast.closeAllLoading();
                  print(response.body);
                  if (response.body.isNotEmpty) {
                    if(json.decode(response.body)["code"] == "200") {
                      dados2 = json.decode(response.body)["resultado"];
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AlugUpHome()));
                    } else {
                      BotToast.showNotification(
                        title: (_) {
                          return Text("Erro ao criar usuario");
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
              } else {
                BotToast.showNotification(
                  title: (_) {
                    return Text("Alguns dados não são validos");
                  }
                );
              }              
            }, child: Text("Criar conta")))),
            SizedBox(height: 15),
            Container(width: MediaQuery.of(context).size.width, height: 60, child: Expanded(child: ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("Fazer login"))))
          ],
        ),
      ),
    );
  }
}