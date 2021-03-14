import 'dart:convert';

import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:bot_toast/bot_toast.dart';
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
        appBar: AppBar(
          title: Text(
            "Meus Dados",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color(0xff66008e),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      controller: nome,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      maxLength: 200,
                      maxLengthEnforced: true,
                      decoration: InputDecoration(
                        labelText: "Nome completo",
                        counterText: "",
                      ),
                    ),
                    TextField(
                      controller: cpf,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "CPF",
                      ),
                    ),
                    TextField(
                      controller: telefone,
                      // margin: EdgeInsets.only(top: 15),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Telefone (Celular)",
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      title: Text("E-MAIL"),
                      subtitle: Text(dados2["email"].toString()),
                    ),
                    ListTile(
                      title: Text("DATA DE NASCIMENTO"),
                      subtitle: Text(dados2["nascimento"].toString()),
                    ),
                  ],
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Color(0xff66008e),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: Center(
                  child: Text(
                    "Atualizar Perfil",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
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
            )
          ],
        ));
  }
}