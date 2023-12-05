import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_material3/flutter_material3.dart';

class PraticaContent {
  final String title;

  PraticaContent(this.title);

  Widget getPage() {
    return ExemploFormularioPage();
  }
}

PraticaContent praticaContent = PraticaContent(
  'Pratica',
);

class ExemploFormularioPage extends StatefulWidget {
  @override
  _ExemploFormularioPageState createState() => _ExemploFormularioPageState();
}

class _ExemploFormularioPageState extends State<ExemploFormularioPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  //DateTime _dataSelecionada = DateTime.now();
  //String _generoSelecionado = '';
  //bool _aceitarTermos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite seu nome',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Digite seu email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _senhaController,
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            //ListTile da data
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Gênero'),
            //Os RadioListTile de genero
            SizedBox(height: 16.0),
            //Colocar aqui o switch dos termos
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para processar o formulário
                _enviarFormulario();
              },
              child: Text('Enviar'),
            ),
          ],
        ),
        ]
      ),
    ),
    );
  }

  void _enviarFormulario() {
    // Adicione a lógica para processar os dados do formulário
    print('Nome: ${_nomeController.text}');
    print('Email: ${_emailController.text}');
    print('Senha: ${_senhaController.text}');
    //print('Data: $_dataSelecionada');
    //print('Gênero: $_generoSelecionado');
    //print('Aceitar Termos: $_aceitarTermos');
  }
}

void main() {
  runApp(MaterialApp(
    home: PraticaContent('Pratica').getPage(),
    theme: ThemeData(
      useMaterial3: true
    ),
  ));
}