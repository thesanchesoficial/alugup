import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/profile/add_endereco.dart';
import 'package:flutter/material.dart';

class MeusEnderecos extends StatefulWidget {
  @override
  _MeusEnderecosState createState() => _MeusEnderecosState();
}

class _MeusEnderecosState extends State<MeusEnderecos> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meus Endereços",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xff66008e),
        centerTitle: true,
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
      bottomNavigationBar: 
        FlatButton(
          padding: EdgeInsets.all(0),
          child: Container(
            color: Color(0xff66008e),
            width: MediaQuery.of(context).size.width,
            height: 55,
            child: Center(
              child: Text(
                "Adicionar endereço",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () async{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NovoEndereco(att: att)),
            );
          },
        ),
    );
  }

  att(){
    setState(() {});
  }
}