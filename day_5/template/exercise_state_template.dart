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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HandphonePage(),
    );
  }
}

class Produk{
  String nama;
  int harga;

  Produk(this.nama, this.harga);
}

class HandphonePage extends StatelessWidget{
  var listHandphone = <Produk>[
    Produk('iPhone 15 Pro', 20000000),
    Produk('Samsung S24', 18000000),
    Produk('Redmi 13C', 1500000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handphone'),
        actions: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.laptop),
            )
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Row(children: [
                Text('0'),
                Icon(Icons.shopping_cart)
              ],),
            ),
          )
        ],
      ),
      body: ListView(
        children: List.generate(listHandphone.length, (i) {
          return Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                      flex:1,
                      child: Text('${listHandphone[i].nama}', style: TextStyle(fontWeight: FontWeight.bold),)
                  ),
                  Expanded(
                      flex:1,
                      child: Text('Rp ${listHandphone[i].harga}')
                  ),
                  Expanded(
                      flex:1,
                      child: ElevatedButton(
                          onPressed: (){
                            //tambah ke keranjang
                          },
                          child: Text('Tambah')
                      )
                  ),
                ],
              )
          );
        })
      ),
    );
  }
}