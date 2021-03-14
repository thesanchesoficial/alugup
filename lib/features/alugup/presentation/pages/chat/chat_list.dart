import 'package:alugup/features/alugup/app/alugup_variaveis.dart';
import 'package:alugup/features/alugup/presentation/pages/chat/chat_individual.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Chats"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff66008e),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 7),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: Text("Arnaldo"),
                  subtitle: Text("${chatArnaldo[chatArnaldo.length - 1]["msg"]}"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatIndividual(
                    messages: chatArnaldo, 
                    appBarTitle: "Arnaldo", 
                    att: att,
                  )),
                );
              },
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: Text("Ronaldo"),
                  subtitle: Text("${chatRonaldo[chatRonaldo.length - 1]["msg"]}"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatIndividual(
                    messages: chatRonaldo, 
                    appBarTitle: "Ronaldo", 
                    att: att,
                  )),
                );
              },
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.all(20),
                child: ListTile(
                  title: Text("Renata"),
                  subtitle: Text("${chatRenata[chatRenata.length - 1]["msg"]}"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatIndividual(messages: chatRenata, appBarTitle: "Renata", att: att)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  att(){
    setState(() {});
  }
}
