import 'package:flutter/material.dart';
import 'package:test_penduduk_api/domain/entities/penduduk.dart';
import 'package:test_penduduk_api/domain/usecases/create_penduduk.dart';
import 'package:test_penduduk_api/domain/usecases/delete_penduduk.dart';
import 'package:test_penduduk_api/domain/usecases/get_penduduk.dart';
import 'package:test_penduduk_api/domain/usecases/update_penduduk.dart';
import 'package:test_penduduk_api/presentation/detail_penduduk_page.dart';

class PendudukPage extends StatefulWidget{
  @override
  State<PendudukPage> createState() => _PendudukPageState();
}

class _PendudukPageState extends State<PendudukPage>{
  TextEditingController _namaController = TextEditingController();
  TextEditingController _usiaController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _idController = TextEditingController();

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
          TextField(
            controller: _idController,
            decoration: InputDecoration(
                labelText: 'Id'
            ),
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  CreatePenduduk().execute(
                      Penduduk(
                          nama: _namaController.text,
                          usia: int.parse(_usiaController.text),
                          keterangan: _keteranganController.text
                      )
                    );
                });
              },
              child: Text('Tambah Data')
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  DeletePenduduk().execute(int.parse(_idController.text));
                  _idController.text = '';
                });
              },
              child: Text('Hapus Data')
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  UpdatePenduduk().execute(
                      Penduduk(
                          nama: _namaController.text,
                          usia: int.parse(_usiaController.text),
                          keterangan: _keteranganController.text
                      ),
                      int.parse(_idController.text)
                  );
                  _idController.text = '';
                });
              },
              child: Text('Update Data')
          ),
          Container(
            height: 300,
            child: FutureBuilder<List<Penduduk>>(
              future: GetPenduduk().execute(),
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