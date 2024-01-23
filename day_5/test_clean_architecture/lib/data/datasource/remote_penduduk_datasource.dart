import 'package:http/http.dart' as http;
import 'dart:convert';

class RemotePendudukDatasource{
    static const URL = 'http://127.0.0.1:8080';

    Future<String> getPenduduk() async{
        var response = await http.get(Uri.parse('${URL}/api/penduduk'));
        return response.body;
    }

    Future<String> createPenduduk(Map<String, dynamic> penduduk) async{
        var response = await http.post(
            Uri.parse('${URL}/api/penduduk'),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
                'nama': penduduk['nama'],
                'usia': penduduk['usia'],
                'keterangan': penduduk['keterangan']
            }),
        );
        return response.body;
    }

    Future<String> updatePenduduk(Map<String, dynamic> penduduk, int id) async{
        var response = await http.put(
            Uri.parse('${URL}/api/penduduk/${id}'),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
                'nama': penduduk['nama'],
                'usia': penduduk['usia'],
                'keterangan': penduduk['keterangan']
            }),
        );
        return response.body;
    }

    Future<String> deletePenduduk(int id) async{
        var response = await http.delete(Uri.parse('${URL}/api/penduduk/${id}'));
        return response.body;
    }
}