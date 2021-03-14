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
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Arnaldo"),
                subtitle: Text("Gostei do produto"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Ronaldo"),
                subtitle: Text("Consegue me entregar no centro?"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: EdgeInsets.all(20),
              child: ListTile(
                title: Text("Renata"),
                subtitle: Text("Como que funciona essa furadeira?"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
