import 'dart:convert';

import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:http/http.dart' as http;

class NovoEndereco extends StatefulWidget {
  final Function att;
  const NovoEndereco({
    Key key,
    this.att,
  }) : super(key: key);
  

  @override
  _NovoEnderecoState createState() => _NovoEnderecoState();
}

class _NovoEnderecoState extends State<NovoEndereco> {

  MaskedTextController cep = MaskedTextController(mask: "00000000");
  TextEditingController rua = TextEditingController();
  MaskedTextController numero = MaskedTextController(mask: "00000");
  TextEditingController bairro = TextEditingController();
  TextEditingController cidade = TextEditingController();
  MaskedTextController estado = MaskedTextController(mask: "AA");
  TextEditingController complemento = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Novo Endereço",
          style: TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.w500,
          ),
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
                    controller: cep,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "CEP",
                      counterText: "",
                    ),
                  ),
                  TextField(
                    controller: rua,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: "Rua",
                    ),
                  ),
                  TextField(
                    controller: numero,
                    // margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Número",
                    ),
                  ),
                  TextField(
                    controller: bairro,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: "Bairro",
                    ),
                  ),
                  TextField(
                    controller: cidade,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: "Cidade",
                    ),
                  ),
                  TextField(
                    controller: estado,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: "Estado",
                    ),
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
                  "Adicionar endereço",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            onPressed: () async{
              Map endereco = {
                "cep": cep.text,
                "logradouro": rua.text,
                "complemento": complemento.text,
                "bairro": bairro.text,
                "localidade": cidade.text,
                "uf": estado.text,
                "ibge": "",
                "gia": "",
                "ddd": "",
                "siafi": "",
              };
              enderecos.add(endereco);
              Navigator.pop(context);
              widget.att();
            },
          )
        ],
      ),
    );
  }
}