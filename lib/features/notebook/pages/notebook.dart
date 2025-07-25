import 'package:flutter/material.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'info_page.dart';

class Handbook extends StatelessWidget {
  const Handbook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
     //home:
    );
  }
}

class HomeScreen extend class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Handbook')),
        drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu chính', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Exercises'),
            onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Sports nutrition'),
            onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('List of ingredients and calorie count'),
            onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Pharmacology'),
            onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Encyclopedia'),
            onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ],
      ),
    ),
  body: const Center(child: Text('Đây là màn hình chính')),
  );
}
}
