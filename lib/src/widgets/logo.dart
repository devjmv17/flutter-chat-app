import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({Key key, this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 190,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/img/tag-logo.png'),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            titulo,
            style: TextStyle(fontSize: 26),
          )
        ],
      ),
    ));
  }
}
