import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/add_cartao.dart';
import 'package:flutter/material.dart';

class Notificacoes extends StatefulWidget {
  @override
  _NotificacoesState createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notificações",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color(0xff66008e),
          centerTitle: true,
        ),
        body: notificacoes.isNotEmpty
          ? Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: notificacoes.length,
                        itemBuilder: (context, index) {
                          Map notificacao = notificacoes[index];
                          return ListTile(
                            title: Text("${notificacao["titulo"]}"),
                            subtitle: Text("${notificacao["descricao"]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.close), 
                              onPressed: () async {
                                notificacoes.removeAt(index);
                                att();
                                // showDialog(
                                //   context: context, 
                                //   builder: (context) {
                                //     return AlertDialog(
                                //       content: Text("Remover este cartão?"),
                                //       actions: [
                                //         FlatButton(
                                //           onPressed: (){
                                //             cartoes.removeAt(index);
                                //             Navigator.pop(context);
                                //             att();
                                //           }, 
                                //           child: Text("Remover"),
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ) 
          : Center(
            child: Text(
              "Sem notificações",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
  }

  att(){
    setState(() {});
  }
}