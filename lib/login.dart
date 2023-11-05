import 'dart:convert';
import 'package:flutter/material.dart';
import 'perfil.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('https://c415-190-115-66-219.ngrok-free.app/login'), // Substitua pelo seu endereço da API
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Login bem-sucedido, você pode navegar para a tela de perfil
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Perfil()),
        );
      } else {
        // Tratar erros de login, por exemplo, exibindo uma mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao fazer login. Verifique suas credenciais.'),
        ));
      }
    } catch (e) {
      print('Erro na solicitação: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro na solicitação. Verifique sua conexão.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login de usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _login,
              child: Text('Logar'),
            ),
          ],
        ),
      ),
    );
  }
}
