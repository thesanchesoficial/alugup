import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:flutter/material.dart';

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
