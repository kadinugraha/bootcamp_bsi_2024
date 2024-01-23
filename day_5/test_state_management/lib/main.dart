import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Produk{
  String nama;
  int harga;

  Produk(this.nama, this.harga);
}

class CartModel extends ChangeNotifier {
  final List<Produk> _items = [];

  //getter
  UnmodifiableListView<Produk> get items => UnmodifiableListView(_items);
  int get totalItem => _items.length;

  void add(Produk item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  int getTotalPrice(){
    int total = 0;
    for(var item in _items){
      total += item.harga;
    }
    return total;
  }
}

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartModel())
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
    );
  }
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
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LaptopPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.laptop),
            )
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CheckoutPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Row(children: [
                Consumer<CartModel>(
                  builder: (context, cart, child){
                    return Text('${cart.totalItem}');
                  },
                ),
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
                            Provider.of<CartModel>(context, listen: false).add(listHandphone[i]);
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

class LaptopPage extends StatelessWidget{
  var listLaptop = <Produk>[
    Produk('HP Paviliun', 15500000),
    Produk('Macbook Pro', 19500000),
    Produk('Asus ROG', 24500000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laptop'),
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HandphonePage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.phone_android),
              )
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CheckoutPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Row(children: [
                Consumer<CartModel>(
                  builder: (context, cart, child){
                    return Text('${cart.totalItem}');
                  },
                ),
                Icon(Icons.shopping_cart)
              ],),
            ),
          )
        ],
      ),
      body: ListView(
          children: List.generate(listLaptop.length, (i) {
            return Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                        flex:1,
                        child: Text('${listLaptop[i].nama}', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    Expanded(
                        flex:1,
                        child: Text('Rp ${listLaptop[i].harga}')
                    ),
                    Expanded(
                        flex:1,
                        child: ElevatedButton(
                            onPressed: (){
                              Provider.of<CartModel>(context, listen: false).add(listLaptop[i]);
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

class CheckoutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HandphonePage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.phone_android),
              )
          ),
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LaptopPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.laptop),
              )
          )
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child){
          var totalPrice = 0;
          return Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView(
                        children: List.generate(cart.items.length, (i) {
                          totalPrice += cart.items[i].harga;
                          return Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Text('${cart.items[i].nama}', style: TextStyle(fontWeight: FontWeight.bold),)
                              ),
                              Expanded(
                                  flex:1,
                                  child: Text('Rp ${cart.items[i].harga}')
                              ),
                            ],
                          );
                        }),
                      )
                  ),
                  Container(
                    child: Text(
                      'Total Harga: Rp ${totalPrice}',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
          );
          return Text('${cart.totalItem}');
        },
      ),
    );
  }
}