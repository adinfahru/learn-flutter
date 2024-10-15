import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Membuat Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Set the AppBar background color
        ),
      ),
      home: const FirstScreen(), // Panggil FirstScreen di sini
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ini Widget'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
              label: const Text('Button with Icon'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {},
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.purple,
              child: const Icon(Icons.navigation),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
