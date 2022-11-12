import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/providers/providers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class apiEvolution {
  //medidas
  static Future apiGetMedidas(int negocio, int sede, int socio) async {
    try {
      final url = Uri.https(AppConstants.url, '/api/estate/listarmedidas');
      final params = {
        "CodigoUnidadNegocio": negocio,
        "CodigoSede": sede,
        "CodigoSocio": socio,
      };
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params),
          encoding: Encoding.getByName("UTF-8"));

      Map values = {};
      values = jsonDecode(utf8.decode(response.bodyBytes));
      return values;
    } catch (e) {
      print(e);
    }
  }
}
