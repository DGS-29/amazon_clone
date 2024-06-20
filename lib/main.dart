// ignore_for_file: unnecessary_const

// ignore: unused_import
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 224, 249, 144),
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 255, 0, 221),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black26,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Center(child: Text('Hey.')),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ), 
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AuthScreen.routeName);
          },
          child: const Text('Go to Auth Screen'),
        ),
      ),
    );
  }
}
