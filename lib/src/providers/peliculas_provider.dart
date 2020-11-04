import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeliculasProvider {
  String _apikey = "30b7b1a8e4ec0a74a231f841d6991e84";
  String _url = "api.themoviedb.org";
  String _language = "es-MX";

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, "3/movie/now_playing", {
      "api_key": _apikey,
      "language": _language,
    });

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final peliculas = Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }
}
