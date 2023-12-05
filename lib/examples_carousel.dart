import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:async';

enum Calendar { day, month, year }
enum Sizes { extraSmall, small, medium, large, extraLarge }

List<Widget> getExamplesCarouselItems() {
  return [
    LoginForm(),
    TaskList(),
    SegmentedButtonApp(),
    PageWithBadge(),
    MaterialExamplesPage(),
    NavigationDrawerApp()
  ];
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Login / Cadastro',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
            ),
            child: Text('Login'),
          ),
          SizedBox(height: 8.0),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.blueAccent,
            ),
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
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Lista de Tarefas para Actions',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
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
            backgroundColor: Colors.blueAccent,
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
          calendarView = newSelection.first;
        });
      },
    );
  }
}

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
      color: Colors.grey.shade100,
      child: Scaffold(
        body: Center(
          child: _progressVisible
              ? LinearProgressIndicator()
              : Text(
            'Conteúdo da Página com Badge',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blueAccent,
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              badges.Badge(
                badgeContent: Icon(Icons.star),
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    _showProgress();
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
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class MaterialExamplesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildListTile(
              context,
              title: 'AlertDialog',
              onTap: () => _showAlertDialog(context),
            ),
            _buildListTile(
              context,
              title: 'Bottom Sheet',
              onTap: () => _showBottomSheet(context),
            ),
            _buildListTile(
              context,
              title: 'Card',
              onTap: () => _showCardExample(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required String title, required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exemplo de AlertDialog'),
          content: Text('Conteúdo do AlertDialog'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Fechar',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Exemplo de Bottom Sheet',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Conteúdo do Bottom Sheet',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                child: Text('Fechar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCardExample(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVYp37ZkfLmItT1CzZzucFCC-fOm4YrTTxownb835d&s',
                    width: double.infinity,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      'Conteúdo do Card',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                    subtitle: Text(
                      'Subtítulo do Card',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    child: Text(
                      'Fechar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
      'Messages', Icon(Icons.widgets_outlined), Icon(Icons.widgets)),
  ExampleDestination(
      'Profile', Icon(Icons.format_paint_outlined), Icon(Icons.format_paint)),
  ExampleDestination(
      'Settings', Icon(Icons.settings_outlined), Icon(Icons.settings)),
];

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const NavigationDrawerExample(),
    );
  }
}

class NavigationDrawerExample extends StatefulWidget {
  const NavigationDrawerExample({super.key});

  @override
  State<NavigationDrawerExample> createState() =>
      _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;
  late bool showNavigationDrawer;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  Widget buildBottomBarScaffold() {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Page Index = $screenIndex'),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: screenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
        },
        destinations: destinations.map(
              (ExampleDestination destination) {
            return NavigationDestination(
              label: destination.label,
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              tooltip: destination.label,
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildDrawerScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                minWidth: 50,
                destinations: destinations.map(
                      (ExampleDestination destination) {
                    return NavigationRailDestination(
                      label: Text(destination.label),
                      icon: destination.icon,
                      selectedIcon: destination.selectedIcon,
                    );
                  },
                ).toList(),
                selectedIndex: screenIndex,
                useIndicator: true,
                onDestinationSelected: (int index) {
                  setState(() {
                    screenIndex = index;
                  });
                },
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Page Index = $screenIndex'),
                  ElevatedButton(
                    onPressed: openDrawer,
                    child: const Text('Open Drawer'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...destinations.map(
                (ExampleDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showNavigationDrawer = MediaQuery.of(context).size.width >= 450;
  }

  @override
  Widget build(BuildContext context) {
    return showNavigationDrawer
        ? buildDrawerScaffold(context)
        : buildBottomBarScaffold();
  }
}
