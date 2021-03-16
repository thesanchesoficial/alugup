import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Favoritos",
        showBackAutomatically: false,
      ),
      body: NenhumItem(titulo: "Poxa... Nenhum favorito", subtitulo: "Selecione um locatário e adicione aos favoritos.")
    );
  }
}