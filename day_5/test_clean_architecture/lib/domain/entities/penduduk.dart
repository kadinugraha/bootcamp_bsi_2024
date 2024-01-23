class Penduduk{
  String nama;
  int usia;
  String keterangan;

  Penduduk({required this.nama, required this.usia, required this.keterangan});

  factory Penduduk.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'nama': String nama,
      'usia': int usia,
      'keterangan': String keterangan
      } => Penduduk(nama: nama, usia: usia, keterangan: keterangan),
      _ => throw const FormatException('Gagal membuat penduduk')
    };
  }

  Map<String, dynamic> toJson(){
    return {
      'nama': this.nama,
      'usia': this.usia,
      'keterangan': this.keterangan
    };
  }
}