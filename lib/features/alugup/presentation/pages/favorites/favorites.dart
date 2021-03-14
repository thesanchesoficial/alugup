import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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