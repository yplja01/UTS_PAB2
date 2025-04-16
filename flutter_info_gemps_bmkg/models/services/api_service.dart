import 'dart:convert';
import 'package:http/http.dart' as http;
import '../gempa_model.dart';

class ApiService {
  static Future<Gempa> fetchGempa() async {
    final response = await http
        .get(Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json'));

    if (response.statusCode == 200) {
      return Gempa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal memuat data gempa');
    }
  }
}
