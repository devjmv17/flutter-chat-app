import 'package:chat/src/global/environment.dart';
import 'package:chat/src/models/usuarios_response.dart';
import 'package:chat/src/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat/src/models/usuario.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;
    } catch (e) {
      print(e);
      return [];
    }
  }
}