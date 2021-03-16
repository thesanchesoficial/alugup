import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/auth/login.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/meus_cartoes.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/meus_enderecos.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/my_alugueis.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/my_dados.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/notificacoes.dart';
import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  Perfil({Key key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: dados2["nome"].toString(),
        showBackAutomatically: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              OwRouter.rightToLeft(context, Login(), removeUntil: true);
            },
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
                  OwRouter.rightToLeft(context, MeusDados());
                },
              ),
              ListTile(
                title: Text("Alugueis"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.receipt_long),
                onTap: () {
                  OwRouter.rightToLeft(context, Alugueis());
                },
              ),
              ListTile(
                title: Text("Cartões"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.credit_card),
                onTap: () {
                  OwRouter.rightToLeft(context, MeusCartoes());
                },
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
                onTap: () {
                  OwRouter.rightToLeft(context, Notificacoes());
                },
              ),
              ListTile(
                title: Text("Meus endereços"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.person_outlined),
                onTap: () {
                  OwRouter.rightToLeft(context, MeusEnderecos());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}