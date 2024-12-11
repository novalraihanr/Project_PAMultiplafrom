import 'package:app_resep_makanan/models/bahan_model.dart';
import 'package:app_resep_makanan/models/instruksi_model.dart';

class Recipe {
  final String namaMakanan;
  final String deskripsiMasakan;
  final int waktuMasak;
  final int kalori;
  List<Instruksi> listInstruksi;
  List<Bahan> listBahan;
  final String urlGambar;

  Recipe({ required this.namaMakanan, required this.deskripsiMasakan, required this.waktuMasak, required this.kalori, required this.listInstruksi, required this.listBahan, required this.urlGambar});

  factory Recipe.fromRTDB(Map<String,dynamic> data) {
    return Recipe(
    namaMakanan : data['namaMakanan'],
    deskripsiMasakan : data['deskripsiMasakan'],
    waktuMasak : data['waktuMasak'],
    kalori : data['kalori'],
    urlGambar : data['urlGambar']);
  }
}
