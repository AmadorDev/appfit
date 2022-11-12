import 'package:appsfit/shared/api/apiEvolution.dart';
import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:flutter/material.dart';

class EvolutionProvider extends ChangeNotifier {
  int _indexSelected = 0;
  get indexSelected => this._indexSelected;

  set indexSelected(indexSelected) {
    this._indexSelected = indexSelected;
    notifyListeners();
  }

  bool _isloading = false;
  get isloading => this._isloading;

  set isloading(value) {
    this._isloading = value;
    notifyListeners();
  }

  List? _evolutions = [];
  List? get getEvolutions => this._evolutions;
  set setEvolutions(List? evolutions) => this._evolutions = evolutions;

  String? _dateDetail = '';
  get dateDetail => this._dateDetail;
  set dateDetail(value) => this._dateDetail = value;

  List? _itemEvolutions = [];
  get getItemEvolutions => this._itemEvolutions;

  set setItemEvolutions(itemEvolutions) {
    this._itemEvolutions = itemEvolutions;
    notifyListeners();
  }

  Future getMedidas(int negocio, int sede, int socio) async {
    final respV = await apiEvolution.apiGetMedidas(negocio, sede, socio);
    if (respV["Date"] != null) {
      if (respV["Date"].length > 0) {
        var resp = respV["Date"];
        this._itemEvolutions = resp[0]["list"];
        this._dateDetail = resp[0]["valor"].toString();
        this._indexSelected = 0;
        notifyListeners();
      }
    }
    return respV;
  }

  Future<List?> geMeasures() async {
    return _evolutions;
  }
}
