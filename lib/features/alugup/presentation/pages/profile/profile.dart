import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/auth/login.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/meus_cartoes.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/meus_enderecos.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/my_alugueis.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/my_dados.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/notificacoes.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff66008e),
        elevation: 0,
        title: Text(dados2["nome"].toString()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => false);
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeusCartoes()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notificacoes()),
                  );
                },
              ),
              ListTile(
                title: Text("Meus endereços"),
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.person_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeusEnderecos()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}