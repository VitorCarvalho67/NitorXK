import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do usuário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60,
                // backgroundImage: AssetImage('assets/user_avatar.png'), // Substitua pelo caminho da imagem do usuário
              ),
            ),
            const Text(
              'Nome de Usuário',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              'Email:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Data de Nascimento: 01/01/1990',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                // Implemente a lógica de logout aqui
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
