import 'dart:convert';
import 'package:components_venver/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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
  MaskedTextController telefone = MaskedTextController(mask: "(00) 00000 0000");
  MaskedTextController nascimento = MaskedTextController(mask: "00/00/0000");
  MaskedTextController cpf = MaskedTextController(mask: "000.000.000-00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Cadastro",
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OwTextField(
              controller: nome,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              labelText: "Nome"
            ),
            SizedBox(height: 15),
            OwTextField(
              controller: telefone,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              labelText: "Telefone"
            ),
            SizedBox(height: 15),
            OwTextField(
              controller: nascimento,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              labelText: "Nascimento"
            ),
            SizedBox(height: 15),
            OwTextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              labelText: "Email"
            ),
            SizedBox(height: 15),
            OwTextField(
              controller: senha,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              labelText: "Senha"
            ),
            SizedBox(height: 15),
            OwTextField(
              controller: cpf,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              labelText: "CPF"
            ),
            SizedBox(height: 15),
            OwButton(
              onPressed: () async {
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
                    return MAP_ERRO_API;
                  }
                } else {
                  BotToast.showNotification(
                    title: (_) {
                      return Text("Alguns dados não são validos");
                    }
                  );
                }        
              },
              labelText: "Criar conta",
            ),
            SizedBox(height: 15),
            OwButton.outline(
              onPressed: () async {
                OwRouter.close(context);
              },
              labelText: "Fazer login",
            )
          ],
        ),
      ),
    );
  }
}