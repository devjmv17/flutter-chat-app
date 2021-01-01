import 'dart:io';
import 'package:chat/src/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textControler = new TextEditingController();
  final _focusNode = new FocusNode();
  bool _estaEcribiendo = false;

  List<ChatMessage> _messages = [
    // ChatMessage(
    //   uid: '1234',
    //   texto: 'Hola Mundo-1',
    //   animationController: AnimationController(
    //       vsync: this, duration: Duration(milliseconds: 2000)),
    // ),
    // ChatMessage(
    //   uid: '12345',
    //   texto: 'Hola Mundo-2',
    // ),
    // ChatMessage(
    //   uid: '1234',
    //   texto: 'Hola Mundo-3',
    // ),
    // ChatMessage(
    //   uid: '12345',
    //   texto: 'Hola Mundo-4',
    // ),
    // ChatMessage(
    //   uid: '1234',
    //   texto: 'Hola Mundo-5',
    // )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text(
                'Jm',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Juanma',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            )
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),
            Divider(
              height: 5,
            ),
            Container(
              color: Colors.white,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textControler,
            onSubmitted: _handleSubmit,
            onChanged: (String texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  _estaEcribiendo = true;
                } else {
                  _estaEcribiendo = false;
                }
              });
            },
            decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),
// Boton enviar
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: _estaEcribiendo
                          ? () => _handleSubmit(_textControler.text.trim())
                          : null,
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                            Icons.send,
                          ),
                          onPressed: _estaEcribiendo
                              ? () => _handleSubmit(_textControler.text.trim())
                              : null,
                        ),
                      ),
                    )),
        ],
      ),
    ));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;
    print(texto);
    _textControler.clear();
    _focusNode.requestFocus();
    final newMessage = ChatMessage(
      uid: '1234',
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEcribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
