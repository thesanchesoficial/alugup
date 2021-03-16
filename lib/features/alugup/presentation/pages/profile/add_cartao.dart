
import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Novo Cartão"
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  OwTextField(
                    controller: numero,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    autofocus: true,
                    labelText: "Número",
                    counterText: "",
                  ),
                  OwTextField(
                    controller: validade,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    labelText: "Validade",
                  ),
                  OwTextField(
                    controller: cvv,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    labelText: "Nome",
                  ),
                  OwTextField(
                    controller: nome,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    labelText: "Nome",
                  ),
                  OwTextField(
                    controller: cpf,
                    margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    labelText: "CPF",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: OwButton(
        onPressed: () async {
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
        radius: 0,
        labelText: "Adicionar cartão",
      ),
    );
  }
}