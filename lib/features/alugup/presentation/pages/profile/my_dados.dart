import 'dart:convert';

import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MeusDados extends StatefulWidget {
  MeusDados({Key key}) : super(key: key);

  @override
  _MeusDadosState createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nascimento = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController cpf = TextEditingController();

  @override
  void initState() {
    super.initState();
    nome.text = dados2["nome"].toString();
    email.text = dados2["email"].toString();
    nascimento.text = dados2["nascimento"].toString();
    cpf.text = dados2["cpf"].toString();
    telefone.text = dados2["telefone"].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Meus Dados"
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  OwTextField(
                    controller: nome,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    labelText: "Nome completo",
                    counterText: "",
                  ),
                  OwTextField(
                    controller: cpf,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    labelText: "CPF",
                  ),
                  OwTextField(
                    controller: telefone,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    labelText: "Telefone (Celular)",
                  ),
                  SizedBox(height: 10),
                  OwListTile(
                    title: Text("E-MAIL"),
                    subtitle: Text(dados2["email"].toString()),
                  ),
                  OwListTile(
                    title: Text("DATA DE NASCIMENTO"),
                    subtitle: Text(dados2["nascimento"].toString()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: OwButton(
        onPressed: () async{ 
          BotToast.showLoading();
          try {
            http.Response response = await http.put("https://matheussanches.wixsite.com/mysite-10/_functions/usuario",
              headers: {
                'Content-Type': 'application/json'
              },
              body: jsonEncode({
                "email": email.text,
                "nome": nome.text,
                "telefone": telefone.text,
                "nascimento": nascimento.text,
                "cpf": cpf.text,
                "_id": dados2["_id"],
                "senha": dados2["senha"],
              })
            );
            BotToast.closeAllLoading();
            if (response.body.isNotEmpty) {
              print(response.body);
              if(json.decode(response.body)["code"] == "200") {
                dados2 = json.decode(response.body)["resultado"];
                Navigator.push(context, MaterialPageRoute(builder: (context) => AlugUpHome()));
              } else {
                BotToast.showNotification(
                  title: (_) {
                    return Text("Erro ao atualizar usuario");
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
        radius: 0,
        labelText: "Atualizar perfil",
      ),
    );
  }
}