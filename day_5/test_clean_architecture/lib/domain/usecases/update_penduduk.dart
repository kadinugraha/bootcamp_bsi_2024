
import 'package:test_penduduk_api/data/repository/penduduk_repository.dart';
import 'package:test_penduduk_api/domain/entities/penduduk.dart';

class UpdatePenduduk{
  var repository = PendudukRepository();

  Future<bool> execute(Penduduk penduduk, int id){
    return repository.updatePenduduk(penduduk, id);
  }
}