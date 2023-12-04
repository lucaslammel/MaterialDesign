import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:async';


List<Widget> getExamplesCarouselItems() {
  return [
    LoginForm(),
    TaskList(),
    SegmentedButtonApp(),
    PageWithBadge(),
  ];
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Login / Cadastro',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: (){},
            child: Text('Login'),
          ),
          SizedBox(height: 8.0),
          TextButton(
            onPressed: (){},
            child: Text('Cadastre-se'),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> tasks = ['Tarefa 1', 'Tarefa 2', 'Tarefa 3'];
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Lista de Tarefas para Actions',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton.extended(
            onPressed: () {
              addTask();
            },
            label: Text('Adicionar Tarefa'),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void addTask() {
    setState(() {
      tasks.add('Nova Tarefa');
    });
  }
}

class SegmentedButtonApp extends StatelessWidget {
  const SegmentedButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text('Escolha Única'),
              SingleChoice(),
              SizedBox(height: 20),
              Text('Múltipla Escolha'),
              MultipleChoice(),
              Spacer(),
            ],
          ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Dia'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Mês'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Ano'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('P')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text('G')),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('GG')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

class PageWithBadge extends StatefulWidget {
  @override
  _PageWithBadgeState createState() => _PageWithBadgeState();
}

class _PageWithBadgeState extends State<PageWithBadge> {
  bool _progressVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200, // Adicionando a cor de fundo
      child: Scaffold(
        appBar: AppBar(
          title: Text('Página com Badge'),
        ),
        body: Center(
          child: _progressVisible
              ? LinearProgressIndicator()
              : Text('Conteúdo da Página com Badge'),
        ),
        backgroundColor: Colors.grey.shade200,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              badges.Badge(
                badgeContent: Icon(Icons.star),
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    _showProgress();
                    // Simulando uma operação demorada
                    Future.delayed(Duration(seconds: 3), () {
                      _hideProgress();
                      _showSnackBar('Página Favorita Aberta');
                    });
                  },
                ),
              ),
              badges.Badge(
                badgeContent: Icon(Icons.email),
                child: IconButton(
                  icon: Icon(Icons.mail),
                  onPressed: () {
                    _showProgress();
                    // Simulando uma operação demorada
                    Future.delayed(Duration(seconds: 3), () {
                      _hideProgress();
                      _showSnackBar('Página de E-mail Aberta');
                    });
                  },
                ),
              ),
              badges.Badge(
                badgeContent: Icon(Icons.chat),
                child: IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    _showProgress();
                    // Simulando uma operação demorada
                    Future.delayed(Duration(seconds: 3), () {
                      _hideProgress();
                      _showSnackBar('Página de Mensagens Aberta');
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProgress() {
    setState(() {
      _progressVisible = true;
    });
  }

  void _hideProgress() {
    setState(() {
      _progressVisible = false;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}