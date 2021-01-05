import 'package:chat/src/pages/login_page.dart';
import 'package:chat/src/pages/usuarios_page.dart';
import 'package:chat/src/services/auth_service.dart';
import 'package:chat/src/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Loading, espere ...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);
    final autenticado = await authService.isLoggedIn();
    if (autenticado) {
      //conectar socket server
      print('> ');
      print('> Estoy en LOADING, voy a conectarme ...');
      socketService.connect();
      print('> ');
      print('> conectado ...');
      Navigator.pushReplacementNamed(context, 'usuarios');
      // Navigator.pushReplacement(
      //     context,
      //     PageRouteBuilder(
      //         pageBuilder: (_, __, ___) => UsuariosPage(),
      //         transitionDuration: Duration(milliseconds: 5)));
    } else {
      Navigator.pushReplacementNamed(context, 'login');
      // Navigator.pushReplacement(
      //     context,
      //     PageRouteBuilder(
      //         pageBuilder: (_, __, ___) => LoginPage(),
      //         transitionDuration: Duration(milliseconds: 5)));
    }
  }
}
