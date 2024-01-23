import 'package:test_penduduk_api/data/repository/penduduk_repository.dart';
import 'package:test_penduduk_api/domain/entities/penduduk.dart';

class DeletePenduduk{
  var repository = PendudukRepository();

  Future<bool> execute(int id){
    return repository.deletePenduduk(id);
  }
}