import 'package:hive/hive.dart';

part 'penduduk.g.dart';

@HiveType(typeId: 0)
class Penduduk extends HiveObject{
  @HiveField(0)
  String nama;

  @HiveField(1)
  int usia;

  @HiveField(2)
  String keterangan;

  Penduduk(this.nama, this.usia, this.keterangan);
}