import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'category_content.dart';
import 'actions_carousel.dart'; // Importe o novo arquivo

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/actions': (context) => CategoryPage(actionsContent),
        // ... Outras categorias
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
            DrawerHeader(
              child: Text('Opções'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Actions'),
              onTap: () {
                Navigator.pushNamed(context, '/actions');
              },
            ),
            // ... Outras opções do Drawer
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo da Home Page'),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final CategoryContent categoryContent;

  CategoryPage(this.categoryContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryContent.title),
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
            items: categoryContent.carouselItems,
          ),
        ],
      ),
    );
  }
}