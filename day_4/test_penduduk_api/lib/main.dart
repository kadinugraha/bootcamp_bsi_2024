import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final URL = 'http://127.0.0.1:8080';

void main() {
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
      home: PendudukPage(),
    );
  }
}

class Penduduk{
  String nama;
  int usia;
  String keterangan;

  Penduduk({required this.nama, required this.usia, required this.keterangan});

  factory Penduduk.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'nama': String nama,
        'usia': int usia,
        'keterangan': String keterangan
      } => Penduduk(nama: nama, usia: usia, keterangan: keterangan),
      _ => throw const FormatException('Gagal membuat penduduk')
    };
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

  Future<List<Penduduk>> getPenduduk() async{
    var response = await http.get(Uri.parse('${URL}/api/penduduk'));
    var jsonArray = jsonDecode(response.body)['data'];
    var listPenduduk = <Penduduk>[];
    for(var i = 0; i < jsonArray.length; i++){
      listPenduduk.add(Penduduk.fromJson(jsonArray[i]));
    }
    return listPenduduk;
  }

  Future<bool> createPenduduk(String nama, int usia, String keterangan) async{
    var response = await http.post(
      Uri.parse('${URL}/api/penduduk'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nama': nama,
        'usia': usia,
        'keterangan': keterangan
      }),
    );
    return jsonDecode(response.body)['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                setState(() {
                  createPenduduk(_namaController.text, int.parse(_usiaController.text), _keteranganController.text);
                });
              },
              child: Text('Tambah Data')
          ),
          Container(
            height: 400,
            child: FutureBuilder<List<Penduduk>>(
              future: getPenduduk(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var listPenduduk = snapshot.data!;
                  return ListView(
                    children: List.generate(listPenduduk.length, (i) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>DetailPendudukPage(listPenduduk[i]))
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Text('${listPenduduk[i].nama}', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('${listPenduduk[i].usia}th')
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }else{
                  return Text('Belum ada data');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class DetailPendudukPage extends StatefulWidget{
  late Penduduk penduduk;
  DetailPendudukPage(this.penduduk);

  @override
  State<DetailPendudukPage> createState() => _DetailPendudukPageState(this.penduduk);
}

class _DetailPendudukPageState extends State<DetailPendudukPage>{
  late Penduduk penduduk;
  _DetailPendudukPageState(this.penduduk);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('${this.penduduk.nama}', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('${this.penduduk.usia}th'),
          Text('${this.penduduk.keterangan}'),
        ],
      ),
    );
  }
}