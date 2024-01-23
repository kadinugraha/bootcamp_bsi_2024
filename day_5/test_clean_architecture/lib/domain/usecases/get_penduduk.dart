import 'package:test_penduduk_api/data/repository/penduduk_repository.dart';
import 'package:test_penduduk_api/domain/entities/penduduk.dart';

class GetPenduduk{
  var repository = PendudukRepository();

  Future<List<Penduduk>> execute(){
    return repository.getPenduduk();
  }
}