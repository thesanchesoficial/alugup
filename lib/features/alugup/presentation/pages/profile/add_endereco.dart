import 'dart:convert';

import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:components_venver/material.dart';
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
      appBar: OwAppBar(
        title: "Novo Endereço"
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
                    controller: cep,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    autofocus: true,
                    labelText: "CEP",
                    counterText: "",
                  ),
                  OwTextField(
                    controller: rua,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    labelText: "Rua",
                  ),
                  OwTextField(
                    controller: numero,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    labelText: "Número",
                  ),
                  OwTextField(
                    controller: bairro,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    labelText: "Bairro",
                  ),
                  OwTextField(
                    controller: cidade,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    labelText: "Cidade",
                  ),
                  OwTextField(
                    controller: estado,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.characters,
                    labelText: "Estado",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: OwButton(
        onPressed: () async {
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
        radius: 0,
        labelText: "Adicionar endereço",
      ),
    );
  }
}