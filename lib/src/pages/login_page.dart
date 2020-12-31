import 'package:chat/src/widgets/boton.dart';
import 'package:chat/src/widgets/custom_input.dart';
import 'package:chat/src/widgets/labels.dart';
import 'package:chat/src/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(
                  titulo: 'Messenger \n Login',
                ),
                _Form(),
                Labels(
                  ruta: 'register',
                  titulo: '¿No tienes cuenta?',
                  subtitulo: 'Crea una ahora!',
                ),
                Text('Términos y condiciones de uso',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            keyboardType: TextInputType.text,
            isPassword: true,
            textController: passwordCtrl,
          ),
          BotonAzul(
            text: 'Entrar',
            onPressed: () {
              print(emailCtrl.text);
              print(passwordCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
