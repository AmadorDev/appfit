import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/models/details/detailsModel.dart';
import 'package:appsfit/shared/models/details/detailsResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FitsProvider extends ChangeNotifier {
  List<Details> onDetailsFits = [];
  Details? detail;
  String keyUser = '';
  String keyEmpresa = '';

  int? indexItem = 0;

  //Optiene los parametros de details
  keyUse(String keyUse, String keyEmp) {
    keyUser = keyUse;
    keyEmpresa = keyEmp;
  }

  get indexIn => indexItem;

  Future<void> detailsFit(Details? s, int? index) async {
    detail = s;
    indexItem = index;
    notifyListeners();
  }

  void detailReset() {
    detail = null;
    notifyListeners();
  }
}
