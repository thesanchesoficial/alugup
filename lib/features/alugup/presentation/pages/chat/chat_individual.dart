import 'package:components_venver/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatIndividual extends StatefulWidget {
  final List<Map<String, dynamic>> messages;
  final String appBarTitle;
  final Function att;
  const ChatIndividual({
    Key key,
    this.messages,
    this.appBarTitle,
    this.att,
  }) : super(key: key);

  @override
  _ChatIndividualState createState() => _ChatIndividualState();
}

class _ChatIndividualState extends State<ChatIndividual> {
  final controller = TextEditingController();
  final scrollController = ScrollController();
  bool criarChat = true;

  bool chatAtivo = true;

  final agora = DateTime.now();

  List<Map<String, dynamic>> messages;

  void iniciarMensagens(){
    messages = widget.messages ?? [
      {
        "msg": "Olá",
        "user": 0,
        "envio": DateTime(agora.year, agora.month, 2, 14, 35),
      },
      {
        "msg": "Oi, boa tarde",
        "user": 1,
        "envio": DateTime(agora.year, agora.month, 2, 14, 36),
      },
      {
        "msg": "Gostaria de alugar este item que você disponibilizou",
        "user": 0,
        "envio": DateTime(agora.year, agora.month, 2, 14, 37),
      },
      {
        "msg": "Tudo bem, este item seria a furadeira?",
        "user": 1,
        "envio": DateTime(agora.year, agora.month, 2, 14, 37),
      },
      {
        "msg": "Sim, isso mesmo",
        "user": 0,
        "envio": DateTime(agora.year, agora.month, 2, 14, 38),
      },
      {
        "msg": "Como que funciona essa furadeira?",
        "user": 0,
        "envio": DateTime(agora.year, agora.month, 2, 14, 38),
      },
    ];
  }

  @override
  void initState() {
    super.initState();
    iniciarMensagens();
  }

  void dispose() {
    
    super.dispose();
  }

  // finalizarChat() async {
  //   bool confirmar = await showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertaSimples(
  //           "Deseja finalizar este chat?",
  //           conteudo:
  //               "${widget.chat.nomeCliente.toString()}\n#${widget.chat.pedido}",
  //           textoBotaoPrimario: "CANCELAR",
  //           textoBotaoSecundario: "FINALIZAR",
  //           funcaoBotaoSecundario: () {
  //             Navigator.pop(context, true);
  //           },
  //         );
  //       });
  //   if (confirmar == true) {
  //     try {
  //       await FirebaseFirestore.instance
  //           .collection("chats")
  //           .doc(widget.chat.id)
  //           .update({"chatFinalizado": true});
  //       setState(() {
  //         widget.chat.finalizado = true;
  //       });
  //     } catch (e) {}
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OwAppBar(
        title: widget.appBarTitle ?? "Chat".toUpperCase(),
      ),
      body: Column(
        children: <Widget>[
          // Expanded(
          //   child: StreamBuilder(
          //     stream: carregarMensagens(),
          //     builder: (context, snapshot) {
          //       switch (snapshot.connectionState) {
          //         case ConnectionState.none:
          //         case ConnectionState.waiting:
          //           return Center(child: CircularProgressIndicator());
          //         default:
          //           return mensagens(snapshot);
          //       }
          //     },
          //   ),
          // ),
          Expanded(
            child: mensagens(messages),
          ),
          !chatAtivo
            ? Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).cardColor,
              child: Center(
                child: Text("Chat finalizado"),
              ),
            )
            : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 20,
                        maxHeight: 150,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Theme.of(context).cardColor),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      width: (MediaQuery.of(context).size.width * 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: "Digite sua mensagem aqui...",
                                counterText: "",
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                              minLines: 1,
                              maxLines: 5,
                              maxLength: 200,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.send_outlined,
                              color: Theme.of(context).textTheme.headline6.color,
                            ),
                            color: Theme.of(context).textTheme.headline6.color,
                            onPressed: () async {
                              if (controller.text.trim().isNotEmpty) {
                                Map<String, dynamic> msg = {
                                  "msg": controller.text.trim(),
                                  "user": 0,
                                  "envio": DateTime.now(),
                                };
                                controller.clear();
                                widget.messages.add(msg);
                                setState(() {});
                                widget.att();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  mensagens(messages) {
    // List<DocumentSnapshot> documents = snapshot.data.documents;
    // documents = documents.reversed.toList();
    // documents.sort((a, b) => a.data()["createdDate"].compareTo(b.data()["createdDate"]));
    String mensagemDia = "Começo da Conversa";
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).secondaryHeaderColor
            ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Para sua proteção, não inclua números de cartões ou outras informações pessoais nestas mensagens.",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          messages != null 
            ? ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
              itemBuilder: (context, index) {
                WidgetsBinding.instance.addPostFrameCallback((_) => {
                  scrollController.jumpTo(scrollController.position.maxScrollExtent)
                });
                // Map valor = messages[index].data();
                bool eu = messages[index]["user"] == 0;
                DateTime agora = messages[index]["envio"];
                List data2 = agora.toString().substring(0, 10).split("-");
                String dia = "${data2[2]}/${data2[1]}/${data2[0]}";
                String aux = mensagemDia;
                if (aux == "Começo da Conversa") aux = dia;
                mensagemDia = dia;
                DateTime envio = messages[index]["envio"];

                String diaEnvio = envio.day > 9 ? "${envio.day}" : "0${envio.day}";
                String mesEnvio = envio.month > 9 ? "${envio.month}" : "0${envio.month}";
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    mensagemDia != aux || index == 0
                      ? Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10, 
                              vertical: 3,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text(
                              "$diaEnvio/$mesEnvio",
                            ),
                          ),
                        ],
                      )
                      : SizedBox(),
                    Row(
                      mainAxisAlignment: !eu
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: 10,
                            maxWidth: MediaQuery.of(context).size.width * 0.65,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: eu
                              ? Colors.purple
                              : Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: eu
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                            children: [
                              Text(
                                messages[index]["msg"].toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: eu
                                    ? Theme.of(context).primaryTextTheme.bodyText1.color
                                    : Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              // valor["createdDate"] != null
                              //     ? Text(
                              //         DateFormat("HH:mm").format(
                              //             DateTime.fromMillisecondsSinceEpoch(
                              //                     valor["createdDate"])
                              //                 .toLocal()),
                              //         style: TextStyle(
                              //           color: !valor["enviadoPorParceiro"]
                              //               ? Theme.of(context)
                              //                   .primaryTextTheme
                              //                   .bodyText1
                              //                   .color
                              //               : Colors.white,
                              //           fontSize: 12,
                              //         ),
                              //       )
                              //     : SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ) 
            : SizedBox(),
        ],
      ),
    );
  }
}