// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/models/bookings/DateModel.dart';
import 'package:appsfit/shared/models/bookings/DateResponse.dart';
import 'package:appsfit/shared/models/bookings/Room.dart';
import 'package:appsfit/shared/models/bookings/RoomResponse.dart';

import 'package:http/http.dart' as http;

class apiBooking {
  //salas
  static Future<RoomResponse> apiGetSalas(int cneg, int cdsede) async {
    try {
      final url =
          Uri.https(AppConstants.url, '/api/booking/listarsalasdisponibles');
      final params = {"CodigoUnidadNegocio": cneg, "CodigoSede": cdsede};
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(params),
          encoding: Encoding.getByName("UTF-8"));
      final res = RoomResponse.fromJson(response.body);
      return res;
    } catch (e) {
      return RoomResponse(
          message1: "--", message2: "ss", status: 400, date: []);
    }
  }

//fechas
  static Future<DateResponse> apiGetDates(
      int cneg, int cdsede, String? cmembresia, int csocio) async {
    try {
      final url =
          Uri.https(AppConstants.url, '/api/booking/listarfechasdisponibles');
      final params = {
        "CodigoUnidadNegocio": cneg,
        "CodigoSede": cdsede,
        'CodigoMembresia': cmembresia,
        "CodigoSocio": csocio
      };
      print(params);
      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      };
      var response = await http.post(
        url,
        body: json.encode(params),
        headers: headers,
      );

      final res = DateResponse.fromJson(utf8.decode(response.bodyBytes));
      return res;
    } catch (e) {
      return DateResponse(message1: "", message2: "", date: []);
    }
  }

  //get horarios
  static Future<List?> apiGetHorarios(
    int cneg,
    int cdsede,
    int csocio,
    String? csala,
    String? dnum,
    String? freserv,
    String? tsala,
    int flag,
  ) async {
    try {
      final url = Uri.https(AppConstants.url, '/api/booking/listarhorarios');
      final params = {
        "CodigoUnidadNegocio": cneg,
        "CodigoSede": cdsede,
        "CodigoSocio": csocio,
        "CodigoSala": tsala == 1 ? 0 : csala,
        "DiaNumero": dnum,
        "FechaHoraReserva": freserv,
        "TipoSala": tsala,
        "FlagCantidadReservaFecha": flag,
      };
      print("params:${params}");

      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      };
      var response = await http.post(
        url,
        body: json.encode(params),
        headers: headers,
      );

      final resp = jsonDecode(utf8.decode(response.bodyBytes));

      return resp["Date"];
    } catch (e) {}
  }

  //reserva
  static Future<Map<String, dynamic>> apiReserva(
      int cneg,
      int cdsede,
      String? fresv,
      String dnum,
      String codMem,
      String? codhcc,
      String disciplina,
      String hitxt,
      String hftxt,
      String cHClasesConfig,
      int cPaq,
      int cSocio,
      String? treal) async {
    try {
      final url = Uri.https(AppConstants.url, '/api/booking/reservarclase');
      final params = {
        "CodigoUnidadNegocio": cneg,
        "CodigoSede": cdsede,
        "CodigoSocio": cSocio,
        "FechaReservacion": fresv,
        "DiaNumero": dnum,
        "CodigoMembresia": codMem,
        "CodigoPaquete": cPaq,
        "CodigoHorarioClasesConfiguracion": cHClasesConfig,
        "Disciplina": disciplina,
        "HoraInicioTexto": hitxt,
        "HoraFinTexto": hftxt,
        "CodigoHorarioClasesConfiguracionTiempoReal": treal ?? ''
      };

      print('params reserva: ${params}');

      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      };
      var response = await http.post(
        url,
        body: json.encode(params),
        headers: headers,
      );
      final resp = jsonDecode(utf8.decode(response.bodyBytes));
      print(response.body);
      return resp!;
    } catch (e) {
      return {"error": e};
    }
  }

//cancel reserve
  static Future<Map<String, dynamic>> apiCancelReserve(
    int CodigoSocio,
    int CodigoUnidadNegocio,
    int CodigoSede,
    String CodigoHorarioClasesConfiguracion,
    String? CodigoHorarioClasesTiempoReal,
    String? CodigoHorarioClasesConfiguracionAsistencias,
  ) async {
    try {
      final url = Uri.https(AppConstants.url, '/api/booking/cancelarclase');
      final params = {
        "CodigoSocio": CodigoSocio,
        "CodigoUnidadNegocio": CodigoUnidadNegocio,
        "CodigoSede": CodigoSede,
        "CodigoHorarioClasesConfiguracion":
            '${CodigoHorarioClasesConfiguracion}',
        "CodigoHorarioClasesConfiguracionTiempoReal":
            CodigoHorarioClasesTiempoReal,
        "CodigoHorarioClasesConfiguracionAsistencias":
            CodigoHorarioClasesConfiguracionAsistencias,
      };

      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      };
      var response = await http.post(
        url,
        body: json.encode(params),
        headers: headers,
      );

      final resp = jsonDecode(utf8.decode(response.bodyBytes));
      print('respusta: ${response.body}');

      return resp!;
    } catch (e) {
      print(e);
      return {"error": e};
    }
  }

//list reservations
  static Future<Map<String, dynamic>> apiListReservations(
    int CodigoUnidadNegocio,
    int CodigoSede,
    int CodigoMembresia,
    int CodigoSocio,
  ) async {
    try {
      final url = Uri.https(
          AppConstants.url, '/api/booking/horariosreservadospendientes');
      final params = {
        "CodigoUnidadNegocio": CodigoUnidadNegocio,
        "CodigoSede": CodigoSede,
        "CodigoMembresia": CodigoMembresia,
        "CodigoSocio": CodigoSocio
      };

      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      };
      var response = await http.post(
        url,
        body: json.encode(params),
        headers: headers,
      );

      final resp = jsonDecode(utf8.decode(response.bodyBytes));

      return resp!;
    } catch (e) {
      return {"error": e};
    }
  }

//profile
  static Future<Map<String, dynamic>> apiProfile(
    String DefaultKeyUser,
  ) async {
    try {
      final url = Uri.https(AppConstants.url, '/api/estate/listarperfil');
      final params = {
        "DefaultKeyUser": DefaultKeyUser,
      };

      var headers = {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      };
      var response = await http.post(
        url,
        body: json.encode(params),
        headers: headers,
      );

      final resp = jsonDecode(utf8.decode(response.bodyBytes));

      return resp!;
    } catch (e) {
      return {"error": e};
    }
  }
}
