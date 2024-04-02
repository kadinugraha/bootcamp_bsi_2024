import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_review/data/datasource/test_source.dart';
import 'package:flutter_review/presentation/login_page.dart';
import 'package:flutter_review/presentation/user_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'data/datasource/production_source.dart';
import 'data/datasource/source.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Source>(ProductionSource());
}

void main() {
  setup();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider())
        ],
      child: MyApp(),
    )
  );
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
      home: LoginPage(),
    );
  }
}
