import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/add_endereco.dart';
import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

class MeusEnderecos extends StatefulWidget {
  @override
  _MeusEnderecosState createState() => _MeusEnderecosState();
}

class _MeusEnderecosState extends State<MeusEnderecos> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: "Meus endereços"
      ),
      body: enderecos.isNotEmpty
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
                      itemCount: enderecos.length,
                      itemBuilder: (context, index) {
                        Map endereco = enderecos[index];
                        return ListTile(
                          title: Text(endereco["logradouro"].toString()),
                          subtitle: Text(endereco["bairro"].toString()),
                          trailing: IconButton(
                            icon: Icon(Icons.delete), 
                            onPressed: () async {
                              showDialog(
                                context: context, 
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("Remover este endereço?"),
                                    actions: [
                                      FlatButton(
                                        onPressed: (){
                                          enderecos.removeAt(index);
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
            "Sem endereços",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      bottomNavigationBar: OwButton(
        onPressed: () async {
          OwRouter.rightToLeft(context, NovoEndereco(att: att));
        },
        radius: 0,
        labelText: "Adicionar endereço",
      )
    );
  }

  att(){
    setState(() {});
  }
}