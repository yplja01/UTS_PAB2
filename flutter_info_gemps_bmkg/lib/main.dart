import 'package:flutter/material.dart';
import 'package:flutter_info_gemps_bmkg/models/services/api_service.dart';
import 'package:flutter_info_gemps_bmkg/models/gempa_model.dart';
void main() {
  runApp(MaterialApp(home: GempaScreen()));
}

class GempaScreen extends StatefulWidget {
  @override
  _GempaScreenState createState() => _GempaScreenState();
}

class _GempaScreenState extends State<GempaScreen> {
  late Future<Gempa> futureGempa;

  @override
  void initState() {
    super.initState();
    futureGempa = ApiService.fetchGempa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info Gempa BMKG")),
      body: FutureBuilder<Gempa>(
        future: futureGempa,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final gempa = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tanggal: ${gempa.Tanggal}"),
                  Text("Jam: ${gempa.Jam}"),
                  Text("Lokasi: ${gempa.Lokasi}"),
                  Text("Magnitudo: ${gempa.Magnitudo}"),
                  Text("Kedalaman: ${gempa.Kedalaman}"),
                  Text("Wilayah: ${gempa.wilayah}"),
                  Text("Dirasakan: ${gempa.dirasakan}"),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
