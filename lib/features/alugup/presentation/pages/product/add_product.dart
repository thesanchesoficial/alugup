import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Adicionar extends StatefulWidget {
  Adicionar({Key key}) : super(key: key);

  @override
  _AdicionarState createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  TextEditingController nome = TextEditingController();
  MoneyMaskedTextController preco = MoneyMaskedTextController(decimalSeparator: ",", thousandSeparator: ".", leftSymbol: "R\$ ");
  MaskedTextController qtd = MaskedTextController(mask: "0000");
  TextEditingController duracao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Adicionar item",
        showBackAutomatically: false,
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
                    controller: nome,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    labelText: "Nome do item",
                    counterText: "",
                  ),
                  OwTextField(
                    margin: EdgeInsets.only(top: 15),
                    controller: preco,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    labelText: "Preço",
                  ),
                  OwTextField(
                    margin: EdgeInsets.only(top: 15),
                    controller: qtd,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    labelText: "Quantidade",
                  ),
                  OwTextField(
                    margin: EdgeInsets.only(top: 15),
                    controller: duracao,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    labelText: "Duração",
                  ),
                ],
              ),
            ),
          ),
          OwButton(
            hideRadius: true,
            labelText: "Cadastrar item",
          ),
        ],
      ),
    );
  }
}