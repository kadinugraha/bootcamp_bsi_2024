import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final URL = 'http://127.0.0.1:8080';

Future<List<Penduduk>> getPenduduk() async {
  final response = await http.get(
      Uri.parse('$URL/api/penduduk')
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body) as Map<String, dynamic>;
    var jsonListPenduduk = result['data'] as List;
    var listPenduduk = <Penduduk>[];
    for(var i = 0; i < jsonListPenduduk.length; i++){
      listPenduduk.add(Penduduk.fromJson(jsonListPenduduk[i] as Map<String, dynamic>));
    }
    return listPenduduk;
  } else {
    throw Exception('Failed to load penduduk');
  }
}

Future<bool> addPenduduk(Penduduk penduduk) async {
  final response = await http.post(
    Uri.parse('$URL/api/penduduk'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nama': penduduk.nama,
      'usia': penduduk.usia,
      'keterangan': penduduk.keterangan
    }),
  );

  if (response.statusCode == 201) {
    var result = jsonDecode(response.body) as Map<String, dynamic>;
    return result['data'] as bool;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Penduduk {
  String nama;
  int usia;
  String keterangan;

  Penduduk({required this.nama, required this.usia, required this.keterangan});

  factory Penduduk.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'nama': String nama,
      'usia': int usia,
      'keterangan': String keterangan
      } =>
          Penduduk(
            nama: nama,
            usia: usia,
            keterangan: keterangan
          ),
      _ => throw const FormatException('Failed to load Penduduk.'),
    };
  }
}

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
      home: PendudukPage(),
    );
  }
}

class PendudukPage extends StatefulWidget{
  @override
  State<PendudukPage> createState() => _PendudukPageState();
}

class _PendudukPageState extends State<PendudukPage>{
  TextEditingController _namaController = TextEditingController();
  TextEditingController _usiaController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  late Future<List<Penduduk>> futurePenduduk;

  @override
  void initState() {
    super.initState();
    futurePenduduk = getPenduduk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Penduduk'),
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: 'Nama'
              ),
            ),
            TextField(
              controller: _usiaController,
              decoration: InputDecoration(
                  labelText: 'Usia'
              ),
            ),
            TextField(
              controller: _keteranganController,
              decoration: InputDecoration(
                  labelText: 'Keterangan'
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  addPenduduk(
                      Penduduk(
                        nama: _namaController.text,
                        usia: int.parse(_usiaController.text),
                        keterangan: _keteranganController.text
                      )
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget)
                  );
                },
                child: Text('Tambah Data')
            ),
            Center(
              child: FutureBuilder<List<Penduduk>>(
                future: futurePenduduk,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var listText = List.generate(snapshot.data!.length, (index) {
                      return Text('${snapshot.data![index].nama} (${snapshot.data![index].usia}th)');
                    });
                    return Container(
                        height: 400,
                        child: ListView(children: listText,
                    )
                  );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
