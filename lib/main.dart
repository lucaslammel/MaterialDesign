import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'category_content.dart';
import 'examples_carousel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/examples': (context) => CategoryPage(examplesContent),
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