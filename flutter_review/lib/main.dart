import 'package:flutter/material.dart';
import 'package:flutter_review/data/datasource/test_source.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/production_source.dart';
import 'data/datasource/source.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Source>(ProductionSource());
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: (){
            final source = getIt<Source>();
            source.login();
          },
          child: Text('Login'),
        )
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
