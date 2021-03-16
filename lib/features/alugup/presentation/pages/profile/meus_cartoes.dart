import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/add_cartao.dart';
import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class MeusCartoes extends StatefulWidget {
  @override
  _MeusCartoesState createState() => _MeusCartoesState();
}

class _MeusCartoesState extends State<MeusCartoes> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Meus cartões"
      ),
      body: cartoes.isNotEmpty
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
                      itemCount: cartoes.length,
                      itemBuilder: (context, index) {
                        Map cartao = cartoes[index];
                        String numero = cartao["numero"].toString().substring(
                          cartao["numero"].toString().length - 4,
                        );
                        return ListTile(
                          title: Text("**** **** **** $numero"),
                          subtitle: Text("${cartao["nome"]}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete), 
                            onPressed: () async {
                              showDialog(
                                context: context, 
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("Remover este cartão?"),
                                    actions: [
                                      FlatButton(
                                        onPressed: (){
                                          cartoes.removeAt(index);
                                          Navigator.pop(context);
                                          att();
                                        }, 
                                        child: Text("Remover"),
                                      ),
                                    ],
                                  );
                                },
                              );
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
            "Sem cartões",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      bottomNavigationBar: OwButton(
        onPressed: () async {
          OwRouter.rightToLeft(context, NovoCartao(att: att));
        },
        radius: 0,
        labelText: "Adicionar cartão",
      ),
    );
  }

  att(){
    setState(() {});
  }
}