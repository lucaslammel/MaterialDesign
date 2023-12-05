import 'package:app_trabalho_material_design/pratica_content.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'examples_content.dart';
import 'examples_carousel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        '/examples': (context) => ExamplesPage(examplesContent),
        '/pratica': (context) => PraticaPage(praticaContent),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Home Page'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text(""),
              accountName: Text("BEM VINDO"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVYp37ZkfLmItT1CzZzucFCC-fOm4YrTTxownb835d&s")
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Exemplos'),
              onTap: () {
                Navigator.pushNamed(context, '/examples');
              },
            ),
            ListTile(
              title: Text('Pratica'),
              onTap: () {
                Navigator.pushNamed(context, '/pratica');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo da Home Page'),
      ),
    );
  }
}

class ExamplesPage extends StatelessWidget {
  final ExamplesContent examplesContent;

  ExamplesPage(this.examplesContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(examplesContent.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.7,
              enlargeCenterPage: true,
            ),
            items: examplesContent.carouselItems,
          ),
        ],
      ),
    );
  }
}

class PraticaPage extends StatelessWidget {
  final PraticaContent praticaContent;

  PraticaPage(this.praticaContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(praticaContent.title),
      ),
      body: praticaContent.getPage(), // Chame o método getPage para obter o widget
    );
  }
}