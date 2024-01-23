import 'package:test_penduduk_api/data/datasource/remote_penduduk_datasource.dart';
import 'dart:convert';

import 'package:test_penduduk_api/domain/entities/penduduk.dart';

class PendudukRepository{
  var remotePendudukDatasource = RemotePendudukDatasource();

  Future<List<Penduduk>> getPenduduk() async{
    var jsonArray = jsonDecode(await remotePendudukDatasource.getPenduduk())['data'];
    var listPenduduk = <Penduduk>[];
    for(var i = 0; i < jsonArray.length; i++){
      listPenduduk.add(Penduduk.fromJson(jsonArray[i]));
    }
    return listPenduduk;
  }

  Future<bool> createPenduduk(Penduduk penduduk) async{
    var response = await remotePendudukDatasource.createPenduduk(penduduk.toJson());
    return jsonDecode(response)['data'];
  }

  Future<bool> updatePenduduk(Penduduk penduduk, int id) async{
    var response = await remotePendudukDatasource.updatePenduduk(penduduk.toJson(), id);
    return jsonDecode(response)['data'];
  }

  Future<bool> deletePenduduk(int id) async{
    var response = await remotePendudukDatasource.deletePenduduk(id);
    return jsonDecode(response)['data'];
  }
}