class Gempa {
  final String tanggal;
  final String jam;
  final String lokasi;
  final String magnitudo;
  final String kedalaman;
  final String wilayah;
  final String dirasakan;

  Gempa({
    required this.tanggal,
    required this.jam,
    required this.lokasi,
    required this.magnitudo,
    required this.kedalaman,
    required this.wilayah,
    required this.dirasakan,
  });

  factory Gempa.fromJson(Map<String, dynamic> json) {
    final data = json['Infogempa']['gempa'];
    return Gempa(
      tanggal: data['Tanggal'],
      jam: data['Jam'],
      lokasi: data['Lintang'] + ", " + data['Bujur'],
      magnitudo: data['Magnitude'],
      kedalaman: data['Kedalaman'],
      wilayah: data['Wilayah'],
      dirasakan: data['Dirasakan'],
    );
  }
}
