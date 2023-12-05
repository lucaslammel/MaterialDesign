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

// Crie instâncias da classe para cada categoria
PraticaContent praticaContent = PraticaContent(
  'Pratica',
  //getExamplesCarouselItems(),
);

class ExemploFormularioPage extends StatefulWidget {
  @override
  _ExemploFormularioPageState createState() => _ExemploFormularioPageState();
}

class _ExemploFormularioPageState extends State<ExemploFormularioPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();
  String _generoSelecionado = '';
  bool _aceitarTermos = false;

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
              ListTile(
                title: Text('Data'),
                subtitle: _dataSelecionada == null
                    ? null
                    : Text(
                  '${_dataSelecionada.day}/${_dataSelecionada.month}/${_dataSelecionada.year}',
                ),
                onTap: () async {
                  DateTime? dataSelecionada = await showDatePicker(
                    context: context,
                    initialDate: _dataSelecionada ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (dataSelecionada != null) {
                    setState(() {
                      _dataSelecionada = dataSelecionada;
                    });
                  }
                },
              ),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Gênero'),
                  RadioListTile<String>(
                    title: Text('Masculino'),
                    value: 'masculino',
                    groupValue: _generoSelecionado,
                    onChanged: (String? value) {
                      setState(() {
                        _generoSelecionado = value ?? '';
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: Text('Feminino'),
                    value: 'feminino',
                    groupValue: _generoSelecionado,
                    onChanged: (String? value) {
                      setState(() {
                        _generoSelecionado = value ?? '';
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text('Aceitar termos de privacidade'),
                      Switch(
                        value: _aceitarTermos,
                        onChanged: (bool value) {
                          setState(() {
                            _aceitarTermos = value;
                          });
                        },
                      ),
                    ],
                  ),
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
    print('Data: $_dataSelecionada');
    print('Gênero: $_generoSelecionado');
    print('Aceitar Termos: $_aceitarTermos');
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