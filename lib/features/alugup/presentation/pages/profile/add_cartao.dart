import 'dart:convert';

import 'package:alugup/features/alugup/app/alugup_home.dart';
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:http/http.dart' as http;

class NovoCartao extends StatefulWidget {
  final Function att;
  const NovoCartao({
    Key key,
    this.att,
  }) : super(key: key);
  

  @override
  _NovoCartaoState createState() => _NovoCartaoState();
}

class _NovoCartaoState extends State<NovoCartao> {

  MaskedTextController numero = MaskedTextController(mask: "0000 0000 0000 0000");
  MaskedTextController validade = MaskedTextController(mask: "00/0000");
  MaskedTextController cvv = MaskedTextController(mask: "000");
  TextEditingController nome = TextEditingController();
  MaskedTextController cpf = MaskedTextController(mask: "000.000.000-00");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Novo Cartão",
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
                    controller: numero,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Número",
                      counterText: "",
                    ),
                  ),
                  TextField(
                    controller: validade,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: "Validade",
                    ),
                  ),
                  TextField(
                    controller: cvv,
                    // margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "CVV",
                    ),
                  ),
                  TextField(
                    controller: nome,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: "Nome",
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
                  "Adicionar cartão",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            onPressed: () async{
              Map cartao = {
                "numero": numero.text,
                "validade": validade.text,
                "cvv": cvv.text,
                "nome": nome.text,
                "cpf": cpf.text,
              };
              cartoes.add(cartao);
              Navigator.pop(context);
              widget.att();
            },
          )
        ],
      ),
    );
  }
}