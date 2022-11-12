import 'package:appsfit/shared/api/apiBooking.dart';
import 'package:appsfit/shared/models/bookings/DateModel.dart';
import 'package:appsfit/shared/models/bookings/DateResponse.dart';
import 'package:appsfit/shared/models/bookings/Room.dart';
import 'package:appsfit/shared/models/bookings/RoomResponse.dart';
import 'package:flutter/material.dart';

class BookinProvider extends ChangeNotifier {
  String? _logoGym;

  get logoGym => this._logoGym;
  set logoGym(value) => this._logoGym = value;

  //for room
  int _codigoUnidadNegocio = 0;
  int _codigoSede = 0;
  //end form room

  //for dates
  String? _codigoMembresia = '';
  int _codigoSocio = 0;
  //end form dates

  //for horarios
  String? _codigoSala = '';
  String? _diaNumero = '';
  String? _fechaHoraReserva = '';
  String? _tipoSala = '';

  //form reserva
  String _codigoHorarioClasesConfiguracion = '';
  int _flag = 0;
  int _cPaquete = 0;
  int get cPaquete => this._cPaquete;

  set cPaquete(int value) => this._cPaquete = value;

  bool _isLoadingBtn = false;
  bool get isLoadingBtn => _isLoadingBtn;
  set isLoadingBtn(bool v) {
    _isLoadingBtn = v;
    notifyListeners();
  }

  //end form horarios

  int _isData = 0;
  bool _activeMembership = false;

  List<Room>? _rooms = [];

  List<DateModel>? _dates = [];

  int _selectRoom = 0;
  int _selectDate = 0;

  int get selectRoom => _selectRoom;
  set selectRoom(int v) {
    _selectRoom = v;
    notifyListeners();
  }

  int get selectDate => _selectDate;
  set selectDate(int v) {
    _selectDate = v;
    notifyListeners();
  }

  int get flag => _flag;
  set flag(int v) {
    _flag = v;
    notifyListeners();
  }

  String get codigoSala => _codigoSala.toString();
  String get fechaHoraReserva => _fechaHoraReserva.toString();
  set codigoSala(String? v) {
    _codigoSala = v;
    notifyListeners();
  }

  set diaNumero(String? v) {
    _diaNumero = v;
    notifyListeners();
  }

  set fechaHoraReserva(String? v) {
    _fechaHoraReserva = v;
    notifyListeners();
  }

  set tipoSala(String? v) {
    _tipoSala = v;
    notifyListeners();
  }

  int get codigoUnidadNegocio => _codigoUnidadNegocio;

  set codigoUnidadNegocio(int v) {
    _codigoUnidadNegocio = v;
    notifyListeners();
  }

  int get codigoSede => _codigoSede;
  set codigoSede(int v) {
    _codigoSede = v;
    notifyListeners();
  }

  int get isData => _isData;
  set isData(int v) {
    _isData = v;
    notifyListeners();
  }

  String get codigoMembresia => _codigoMembresia.toString();

  set codigoMembresia(String? v) {
    _codigoMembresia = v;
    notifyListeners();
  }

  int get codigoSocio => _codigoSocio;

  set codigoSocio(int v) {
    _codigoSocio = v;
    notifyListeners();
  }

  bool get activeMembership => _activeMembership;
  set activeMembership(bool v) {
    _activeMembership = v;
    notifyListeners();
  }

  //getSalas
  Future<RoomResponse> getRoom(int cneg, int cdsede) async {
    final resp = await apiBooking.apiGetSalas(cneg, cdsede);
    _selectDate = 0;
    _selectRoom = 0;
    notifyListeners();
    if (resp.date!.length > 0) {
      _codigoSala = "${resp.date![0].codigoSala}";
      _tipoSala = "${resp.date![0].tipoSala}";
    }
    return resp;
  }

  get rooms => _rooms;

//getDates fechas
  Future<DateResponse> getDates(String? cmembresia, int csocio) async {
    final resp = await apiBooking.apiGetDates(
        this._codigoUnidadNegocio, this._codigoSede, cmembresia, csocio);
    if (resp.date!.length > 0) {
      _diaNumero = "${resp.date![0].diaSemana}";
      _fechaHoraReserva = "${resp.date![0].fechaTextoParametro}";
      _flag = resp.date![0].flagCantidadReserva;
    }
    return resp;
  }

//horarios
  Future<List?> getHorarios() async {
    await Future.delayed(Duration(seconds: 0));
    if (_tipoSala != '' && _fechaHoraReserva != '') {
      final resp = await apiBooking.apiGetHorarios(
          _codigoUnidadNegocio,
          _codigoSede,
          _codigoSocio,
          _codigoSala,
          _diaNumero,
          _fechaHoraReserva,
          _tipoSala,
          _flag);

      print("---api call getHorarios  ");
      return resp;
    }
    return [];
  }

//reserve
  Future<Map<String, dynamic>> reserva(
      String? codhcc,
      String disciplina,
      String hitxt,
      String hftxt,
      String c_HClasesConfig,
      int c_paq,
      String? treal) async {
    final resp = await apiBooking.apiReserva(
      _codigoUnidadNegocio,
      _codigoSede,
      _fechaHoraReserva,
      _diaNumero.toString(),
      _codigoMembresia.toString(),
      codhcc,
      disciplina,
      hitxt,
      hftxt,
      c_HClasesConfig,
      _cPaquete,
      _codigoSocio,
      treal,
    );
    return resp;
  }

  //reserve cancel
  Future<Map<String, dynamic>> reserveCancel(
    int CodigoSocio,
    String CodigoHorarioClasesConfiguracion,
    String? CodigoHorarioClasesTiempoReal,
    String? CodigoHorarioClasesConfiguracionAsistencias,
  ) async {
    final resp = await apiBooking.apiCancelReserve(
        CodigoSocio,
        _codigoUnidadNegocio,
        _codigoSede,
        CodigoHorarioClasesConfiguracion,
        CodigoHorarioClasesTiempoReal,
        CodigoHorarioClasesConfiguracionAsistencias);
    return resp;
  }

  get dates => _dates;

//reset date:room,dates
  void resetDate() {
    _dates = [];
    _rooms = [];
  }
}
