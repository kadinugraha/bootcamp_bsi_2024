import 'dart:collection';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

class Item{
  String nama;
  int harga;

  Item({required this.nama, required this.harga});
}

class CartModel extends ChangeNotifier{
  List<Item> _items = [];

  //getter
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  int get totalItem => _items.length;

  //method
  void add(Item item){
    _items.add(item);
    notifyListeners();
  }
}

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartModel()),
        ],
        child: MyApp(),
      )
  );
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
      debugShowCheckedModeBanner: false,
    );
  }
}

class HandphonePage extends StatelessWidget{
  var listItem = [
    Item(nama: 'iPhone 15', harga: 20000000),
    Item(nama: 'Samsung S24', harga: 18000000),
    Item(nama: 'Xiaomi Redmi 10', harga: 1250000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handphone'),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LaptopPage())
                );
              },
              child: Icon(Icons.laptop)
          ),
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage())
                );
              },
              child: Row(
                children: [
                  Icon(Icons.shopping_cart),
                  Consumer<CartModel>(
                    builder: (context, cart, child) => Text('${cart.totalItem}')
                  )
              ],)
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: List.generate(listItem.length, (i) {
            return Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('${listItem[i].nama}')
                ),
                Expanded(
                    flex: 1,
                    child: Text('${CurrencyFormat.convertToIdr(listItem[i].harga, 2)}')
                ),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: (){
                        Provider.of<CartModel>(context, listen: false).add(listItem[i]);
                      },
                      child: Text('Tambah'),
                    )
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class LaptopPage extends StatelessWidget{
  var listItem = [
    Item(nama: 'Asus ROG', harga: 17500000),
    Item(nama: 'Macbook Air', harga: 13500000),
    Item(nama: 'Samsung Chromebook', harga: 2399000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptop'),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HandphonePage())
                );
              },
              child: Icon(Icons.phone_android)
          ),
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage())
                );
              },
              child: Row(
                children: [
                  Icon(Icons.shopping_cart),
                  Consumer<CartModel>(
                      builder: (context, cart, child) => Text('${cart.totalItem}')
                  )
                ],)
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: List.generate(listItem.length, (i) {
            return Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('${listItem[i].nama}')
                ),
                Expanded(
                    flex: 1,
                    child: Text('${CurrencyFormat.convertToIdr(listItem[i].harga, 2)}')
                ),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: (){
                        Provider.of<CartModel>(context, listen: false).add(listItem[i]);
                      },
                      child: Text('Tambah'),
                    )
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LaptopPage())
                );
              },
              child: Icon(Icons.laptop)
          ),
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HandphonePage())
                );
              },
              child: Icon(Icons.phone_android)
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Consumer<CartModel>(
          builder: (context, cart, child){
            int totalHarga = 0;

            return Column(
              children: [
                Container(
                  height: 500,
                  child: ListView(
                    children: List.generate(cart.items.length, (i) {
                      totalHarga += cart.items[i].harga;
                      return Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('${cart.items[i].nama}')
                          ),
                          Expanded(
                              flex: 1,
                              child: Text('${CurrencyFormat.convertToIdr(cart.items[i].harga, 2)}')
                          )
                        ],
                      );
                    }),
                  ),
                ),
                Text('Total Harga: ${CurrencyFormat.convertToIdr(totalHarga, 2)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
              ],
            );
          },
        )
      ),
    );
  }
}
