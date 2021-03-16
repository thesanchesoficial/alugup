import 'package:alugup/features/alugup/presentation/pages/product/product.dart';
import 'package:alugup/features/alugup/presentation/pages/seller/seller.dart';
import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List categorias = [
    "Beleza e cuidados",
    "Brinquedos",
    "Buffet",
    "Eletrônicos",
    "Esportes",
    "Ferramentas",
    "Lanchonetes",
    "Livro",
    "Mêcanica",
    "Móveis",
    "Praia",
    "Roupas",
    "Outros"
  ];

  List adicionadosRecentemente = [
    {
      "preco": "R\$ 8,00/h",
      "title": "Furadeira",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 1,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794300122300416/depositphotos_6933704-stock-photo-human-hand-holding-drill-machine.png"
    },
    {
      "preco": "R\$ 5,00/h",
      "title": "Chapinha",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 2,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794547548749834/128037566277595.png"
    },
    {
      "preco": "R\$ 15,00/dia",
      "title": "Bola",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 5,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794045443899412/football-20180823085945694.png"
    },
    {
      "preco": "R\$ 18,00/dia",
      "title": "Cadeira de praia",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 7,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783793928897953832/cadeira-praia-praia-em-pattaya_41929-301.png"
    },
    {
      "preco": "R\$ 32,00/dia",
      "title": "Banqueta",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 1,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794136406949938/6343-banqueta-alta-iaia-atelier-gustavo-bittencourt-1-3200.png"
    },
    {
      "preco": "R\$ 48,00/dia",
      "title": "Macaco hidráulico",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "quantidade": 1,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783794445803585546/macaco.png"
    },
  ];

  List locatarios = [
    {
      "nome": "Israel Brito",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "nota": 5,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783797918268260402/pp.png?width=517&height=517"
    },
    {
      "nome": "Nicollas Fonseca",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "nota": 5,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783798386150080543/pp.png?width=517&height=517"
    },
    {
      "nome": "Augusto Dante",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "nota": 4.9,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783798025431678986/pp.png?width=517&height=517"
    },
    {
      "nome": "Oliveira da Silva",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "nota": 4.8,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783798127978217512/pp.png?width=517&height=517"
    },
    {
      "nome": "Victor Mota",
      "descricao":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      "nota": 4.8,
      "imagem":
          "https://media.discordapp.net/attachments/723953996645138463/783798256190357514/pp.png?width=517&height=517"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: OwAppBar(
          title: "alugUP",
          showBackAutomatically: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(800))),
                  child: Center(
                      child: Row(
                    children: [
                      Expanded(
                        child: Text("Digite um termo para buscar"),
                      ),
                      Icon(Icons.search)
                    ],
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Categorias",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.only(top: 8),
                height: 50,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 20, left: 10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categorias.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Center(
                          child: Text(categorias[index],
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ));
                  },
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Text("Adicionados recentemente",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Container(
                height: 210,
                margin: EdgeInsets.only(top: 8),
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 20),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: adicionadosRecentemente.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        OwRouter.bottomStack(context, DetalhesItem(adicionadosRecentemente[index]));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.grey[200].withOpacity(.6),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8)),
                              child: Image.network(
                                adicionadosRecentemente[index]["imagem"],
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        adicionadosRecentemente[index]["preco"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff66008e),
                                            fontWeight: FontWeight.bold)),
                                    Text(adicionadosRecentemente[index]
                                        ["title"]),
                                    Text(
                                        "${adicionadosRecentemente[index]["quantidade"]} item"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Locatários",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 173,
                margin: EdgeInsets.only(top: 8),
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 20),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: locatarios.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        OwRouter.bottomStack(context, DetalhesLocatarios(locatarios[index]));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(left: 20),
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey[200].withOpacity(.6),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                  child: Image.network(
                                    locatarios[index]["imagem"],
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(locatarios[index]["nome"]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                SizedBox(width: 5),
                                Text("${locatarios[index]["nota"]}",
                                    maxLines: 1),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ));
  }
}