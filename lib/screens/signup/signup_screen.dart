import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nome Completo',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'E-mail',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Senha',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Repita a Senha',
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
