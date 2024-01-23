import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class Album{
  int userId;
  int id;
  String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'id': int id,
        'title': String title,
        'userId': int userId
      } => Album(
        id: id,
        userId: userId,
        title: title
      ),
      _ => throw const FormatException('Gagal membuka album.')
    };
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  TextEditingController _titleController = TextEditingController();
  Future<Album>? _futureAlbum = null;

  Future<Album> getAlbum() async{
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/3'));
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<Album> createAlbum(String title) async{
    var response = await http.put(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'userId': 999
        }),
    );
    print(response.body.toString());
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title'
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _futureAlbum = createAlbum(_titleController.text);
                  });
                },
                child: Text('Simpan')
            ),
            FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  var album = snapshot.data!;
                  return Text('${album.title}');
                }else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }else{
                  return Text('Belum ada data');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}