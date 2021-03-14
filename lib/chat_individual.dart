import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatIndividual extends StatefulWidget {
  final List<Map<String, dynamic>> messages;
  final String appBarTitle;
  const ChatIndividual({
    Key key,
    this.messages,
    this.appBarTitle,
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
      appBar: AppBar(
        title: Text(
          widget.appBarTitle ?? "Chat",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        actions: [
          // widget.chat.finalizado
          //   ? SizedBox()
          //   : Tooltip(
          //     message: "Finalizar",
          //     child: IconButton(
          //       icon: Icon(Icons.check_circle_outline_sharp),
          //       onPressed: () async {
          //         finalizarChat();
          //       }
          //     ),
          //   ),
          // Tooltip(
          //   message: "Informações",
          //   child: IconButton(
          //     icon: Icon(Icons.info_outline),
          //     onPressed: () async {
          //       var retorno = await Api.buscarPedido(widget.chat.id, exibirToast: true);
          //       if(retorno["code"].toString() == "200"){
          //         PedidoEntity pedido = PedidoEntity.fromMap(retorno["success"]);
          //         Navigator.push(context, DireitaEsquerda(page: DetalhesPedido(pedido, () {})));
          //       }
          //     },
          //   ),
          // ),
        ],
        centerTitle: true,
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
          mensagens(messages),
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
                child: Container(
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
                          autofocus: chatAtivo,
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
                          // if (criarChat) {
                          //   if (!widget.chat.veioDoChat) await createChat();
                          //   criarChat = false;
                          // }
                          // WidgetsBinding.instance.addPostFrameCallback(
                          //     (_) => {
                          //           controllerRolagem.jumpTo(
                          //               controllerRolagem
                          //                   .position.maxScrollExtent)
                          //         });
                          // while (control.text.contains("\n\n\n"))
                          //   control.text =
                          //       control.text.replaceAll("\n\n\n", "\n\n");
                          // control.text = control.text.trim();
                          // if (control.text.isNotEmpty) {
                          //   FirebaseFirestore.instance
                          //       .collection("chats")
                          //       .doc(widget.chat.id)
                          //       .update({
                          //     "mensagem": control.text,
                          //     "enviadoPorParceiro": true,
                          //     "updatedDate":
                          //         DateTime.now().millisecondsSinceEpoch
                          //   });
                          //   FirebaseFirestore.instance
                          //       .collection("chats")
                          //       .doc(widget.chat.id)
                          //       .collection("mensagens")
                          //       .doc()
                          //       .set({
                          //     "mensagem": control.text,
                          //     "enviadoPorParceiro": true,
                          //     "read": false,
                          //     "createdDate":
                          //         DateTime.now().millisecondsSinceEpoch
                          //   });
                          //   NOTIFICACAO_DE_MENSAGEM(widget.chat.idParceiro
                          //       .toString()); // Notificar para o Parceiro
                          // }
                          // control.clear();
                        },
                      ),
                    ],
                  ),
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
                            // child: Text(
                            //   "${envio.day}/${envio.month}",
                            // ),
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