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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;
  List<Widget> listWidget = [
    Center(
      child: Text('Selamat Datang'),
    ),
    Column(
      children: [
        Text('Nama: Kristian Adi Nugraha'),
        Text('Usia: 17 tahun')
      ],
    ),
    Center(
      child: Text('Ini Halaman Ketiga'),
    ),
    Center(
      child: Text('Selamat Datang'),
    ),
    Column(
      children: [
        Text('Nama: Kristian Adi Nugraha'),
        Text('Usia: 17 tahun')
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coba Navigation'),
      ),
      body: listWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (i){
          setState(() {
            _selectedIndex = i;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
