import 'package:flutter/material.dart';

class Adicionar extends StatefulWidget {
  Adicionar({Key key}) : super(key: key);

  @override
  _AdicionarState createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Adicionar"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff66008e),
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
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 200,
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                      labelText: "Nome do item",
                      counterText: "",
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Preço",
                    ),
                  ),
                  TextField(
                    // margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Quantidade",
                    ),
                  ),
                  TextField(
                    // margin: EdgeInsets.only(top: 15),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Duração",
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
                  "Cadastrar Item",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}