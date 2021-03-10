import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

Map dados2;

class Splash extends StatelessWidget {
  carregarNovaTela(context) async {
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    carregarNovaTela(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Image.asset(
            "assets/images/background.png",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 50),
                          child: Text(
                            "Encontre objetos com base em interreses em comum.",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.043,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);

  List telas = [
    Inicio(),
    Chat(),
    Favoritos(),
    Adicionar(),
    Perfil(),
  ];

  int indiceTela = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[indiceTela],
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (index) {
          if(index == 4 && dados2.isEmpty) {
            
          } else {
            setState(() {
              indiceTela = index;
            });
          }
        },
        selectedIndex: indiceTela,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Inicio"),
            activeColor: Color(0xff66008e),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message_outlined),
            title: Text("Chats"),
            activeColor: Color(0xff66008e),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite_outline),
            title: Text("Favoritos"),
            activeColor: Color(0xff66008e),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add),
            title: Text("Adicionar"),
            activeColor: Color(0xff66008e),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Perfil"),
            activeColor: Color(0xff66008e),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: indiceTela,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index){
      //     setState(() {
      //       indiceTela = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined), title: Text("Inicio")),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search), title: Text("Buscar")),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add), title: Text("Adicionar")),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline), title: Text("Perfil"),),
      //   ],
      // ),
    );
  }
}

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("alugUP"),
          centerTitle: true,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetalhesItem(
                                    adicionadosRecentemente[index])));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetalhesLocatarios(locatarios[index])));
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

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Chats"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff66008e),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 7),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Arnaldo"),
                subtitle: Text("Gostei do produto"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Ronaldo"),
                subtitle: Text("Consegue me entregar no centro?"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Renata"),
                subtitle: Text("Como que funciona essa furadeira?"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff66008e),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Poxa... Nenhum favorito"),
            SizedBox(height: 10),
            Text("Selecione um locatário e adicione aos favoritos.")
          ],
        ),
      ),
    );
  }
}

class Buscar extends StatefulWidget {
  Buscar({Key key}) : super(key: key);

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class Perfil extends StatefulWidget {
  Perfil({Key key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff66008e),
        elevation: 0,
        title: Text("João"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text("Meus dados"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.person_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeusDados()),
                  );
                },
              ),
              ListTile(
                title: Text("Alugueis"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.receipt_long),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Alugueis()),
                  );
                },
              ),
              ListTile(
                title: Text("Cartões"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.credit_card),
                onTap: () {},
              ),
              ListTile(
                title: Text("Fidelidade"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.star_border),
                onTap: () {},
              ),
              ListTile(
                title: Text("Notificações"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.notifications_active_outlined),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeusDados extends StatefulWidget {
  MeusDados({Key key}) : super(key: key);

  @override
  _MeusDadosState createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                        labelText: "Nome completo",
                        counterText: "",
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "CPF",
                      ),
                    ),
                    TextField(
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
                      subtitle: Text("joaoalgusto@gmail.com"),
                    ),
                    ListTile(
                      title: Text("DATA DE NASCIMENTO"),
                      subtitle: Text("01/01/1990"),
                    ),
                    FlatButton(
                      child: Text(
                        "Redefinir senha",
                        style: TextStyle(
                          color: Color(0xff66008e),
                        ),
                      ),
                      onPressed: () {},
                    )
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
              onPressed: () {},
            )
          ],
        ));
  }
}

List alugueisRealizados = [
  {
    "preco": "R\$ 68,00",
    "title": "Macaco hidráulico",
    "quantidade": 1,
    "imagem":
        "https://media.discordapp.net/attachments/723953996645138463/783794445803585546/macaco.png",
    "dataAluguel": "12/11/2020",
    "periodoAlugado": "48",
  },
  {
    "preco": "R\$ 25,75",
    "title": "Bola",
    "quantidade": 2,
    "imagem":
        "https://media.discordapp.net/attachments/723953996645138463/783794045443899412/football-20180823085945694.png",
    "dataAluguel": "29/11/2020",
    "periodoAlugado": "24",
  },
];

class Alugueis extends StatefulWidget {
  Alugueis({Key key}) : super(key: key);

  @override
  _AlugueisState createState() => _AlugueisState();
}

class _AlugueisState extends State<Alugueis> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alugueis",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xff66008e),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: alugueisRealizados.length,
                separatorBuilder: (contex, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (contex, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: largura - 20,
                    height: 100,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10)),
                            child: Image.network(
                              alugueisRealizados[index]["imagem"],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: largura - 20 - 160,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      alugueisRealizados[index]["title"]
                                          .toString(),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Text(
                                    alugueisRealizados[index]["preco"]
                                        .toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Alugado por: " +
                                        alugueisRealizados[index]
                                                ["periodoAlugado"]
                                            .toString() +
                                        "h",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "Data: " +
                                        alugueisRealizados[index]["dataAluguel"]
                                            .toString(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "Quantidade: " +
                                        alugueisRealizados[index]["quantidade"]
                                            .toString() +
                                        " unidade" +
                                        "${alugueisRealizados[index]["quantidade"] > 1 ? "s" : ""}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
