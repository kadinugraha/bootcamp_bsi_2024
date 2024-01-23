import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_hive_penduduk/penduduk.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(PendudukAdapter());
  var box = await Hive.openBox<Penduduk>('pendudukBox');
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

  late var box;

  @override
  void initState() {
    box = Hive.box<Penduduk>('pendudukBox');
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
                  box.add(
                      Penduduk(
                        _namaController.text,
                        int.parse(_usiaController.text),
                        _keteranganController.text
                      )
                  );
                });
              },
              child: Text('Tambah Data')
          ),
          Container(
            height: 400,
            child: ListView(
                children: List.generate(box.values.toList().length, (i) {
                  //var color = listPenduduk[i].usia > 30 ? Colors.red : Colors.blue;
                  late var color;
                  if(box.get(i).usia > 30){
                    color = Colors.red;
                  }else{
                    color = Colors.blue;
                  }

                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>DetailPendudukPage(box.get(i)))
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Text('${box.get(i).nama}', style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                          Text('${box.get(i).usia}th')
                        ],
                      ),
                    ),
                  );
                })
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