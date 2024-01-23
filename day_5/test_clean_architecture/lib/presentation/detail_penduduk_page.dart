import 'package:flutter/material.dart';
import 'package:test_penduduk_api/domain/entities/penduduk.dart';

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