import 'package:flutter/material.dart';

class DetalhesItem extends StatefulWidget {
  Map dados;
  DetalhesItem(this.dados);

  @override
  _DetalhesItemState createState() => _DetalhesItemState(dados);
}

class _DetalhesItemState extends State<DetalhesItem> {
  Map dados;
  _DetalhesItemState(this.dados);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dados["title"]),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff66008e),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2.5,
              child: Image.network(dados["imagem"], fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(dados["title"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(dados["preco"],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff66008e))),
            SizedBox(height: 20),
            Text(dados["descricao"]),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xff66008e),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Center(
          child: Text("ALUGAR AGORA",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

