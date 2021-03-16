import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/chat/chat_list.dart';
import 'package:alugup/features/alugup/presentation/pages/favorites/favorites.dart';
import 'package:alugup/features/alugup/presentation/pages/home/home.dart';
import 'package:alugup/features/alugup/presentation/pages/product/add_product.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/profile.dart';
import 'package:alugup/features/alugup/theme/app_theme.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class AlugUpHome extends StatefulWidget {
  @override
  _AlugUpHomeState createState() => _AlugUpHomeState();
}

enum UniLinksType { string, uri }

class _AlugUpHomeState extends State<AlugUpHome> with SingleTickerProviderStateMixin {
  final PageController pageController = PageController(initialPage: 0);

  List telas = [
    Inicio(),
    Chat(),
    Favoritos(),
    Adicionar(),
    Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[INDICEATUAL],
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (index) {
          setState(() {
            INDICEATUAL = index;
          });
        },
        selectedIndex: INDICEATUAL,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Inicio"),
            activeColor: AppTheme.verdeVenver,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message_outlined),
            title: Text("Chats"),
            activeColor: AppTheme.verdeVenver,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite_outline),
            title: Text("Favoritos"),
            activeColor: AppTheme.verdeVenver,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add),
            title: Text("Adicionar"),
            activeColor: AppTheme.verdeVenver,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Perfil"),
            activeColor: AppTheme.verdeVenver,
          ),
        ],
      ),
    );
  }
}