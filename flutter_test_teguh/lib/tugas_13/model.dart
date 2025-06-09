class Kehadiran { // menyimpan informasi kehadiran
  final int? id;
  final String nama;
  final String tanggal;
  final String jam;
  final String keterangan;

  Kehadiran({
    this.id,
    required this.nama,
    required this.tanggal,
    required this.jam,
    required this.keterangan,
  });

  factory Kehadiran.fromMap(Map<String, dynamic> map) { //fungsi : mengubah data dari Map( database menjadi objek kehadiran) //database => objek
    return Kehadiran(
      id: map['id'], //mengambil nilai id dari Map
      nama: map['nama'],
      tanggal: map['tanggal'],
      jam: map['jam'],
      keterangan: map['keterangan'], //di mapping ke field keterangan
    );
  }

  Map<String, dynamic> toMap() {  //mengubah objek kehadiran menjadi Map untuk disimpan database //objek ke database
    return {
      'id': id,
      'nama': nama,
      'tanggal': tanggal,
      'jam': jam,
      'keterangan': keterangan,
    };
  }
}
