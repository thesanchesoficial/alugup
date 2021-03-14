import 'package:alugup/features/alugup/presentation/pages/product/product.dart';
import 'package:flutter/material.dart';


class DetalhesLocatarios extends StatefulWidget {
  Map dados;
  DetalhesLocatarios(this.dados);

  @override
  _DetalhesLocatariosState createState() => _DetalhesLocatariosState(dados);
}

class _DetalhesLocatariosState extends State<DetalhesLocatarios> {
  Map dados;
  _DetalhesLocatariosState(this.dados);

  List adicionadosRecentemente = [
    {
      "preco": "R\$ 40,00",
      "title": "Furadeira",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 1,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794300122300416/depositphotos_6933704-stock-photo-human-hand-holding-drill-machine.png"
    },
    {
      "preco": "R\$ 35,00",
      "title": "Chapinha",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 2,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794547548749834/128037566277595.png"
    },
    {
      "preco": "R\$ 25,75",
      "title": "Bola",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 5,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794045443899412/football-20180823085945694.png"
    },
    {
      "preco": "R\$ 30,00",
      "title": "Cadeira de praia",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 7,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783793928897953832/cadeira-praia-praia-em-pattaya_41929-301.png"
    },
    {
      "preco": "R\$ 32,00",
      "title": "Banqueta",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 1,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794136406949938/6343-banqueta-alta-iaia-atelier-gustavo-bittencourt-1-3200.png"
    },
    {
      "preco": "R\$ 68,00",
      "title": "Macaco hidráulico",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 1,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794445803585546/macaco.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dados["nome"]),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff66008e),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    child: Image.network(dados["imagem"],
                        fit: BoxFit.cover, width: 250, height: 250),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(dados["nome"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(dados["descricao"]),
            SizedBox(height: 50),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: adicionadosRecentemente.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetalhesItem(adicionadosRecentemente[index])));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300], width: 1),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.network(
                            adicionadosRecentemente[index]["imagem"],
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(adicionadosRecentemente[index]["preco"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(adicionadosRecentemente[index]["title"]),
                              Text(
                                  "${adicionadosRecentemente[index]["quantidade"]} item"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xff66008e),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Center(
          child: Text("CHAT",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
