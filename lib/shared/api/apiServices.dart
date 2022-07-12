import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/models/details/detailsModel.dart';
import 'package:appsfit/shared/models/details/detailsResponse.dart';
import 'package:appsfit/shared/models/favorite/favoriteModel.dart';
import 'package:appsfit/shared/models/favorite/favoriteResponse.dart';
import 'package:appsfit/shared/models/search/searchModel.dart';
import 'package:appsfit/shared/models/search/serachResponse.dart';
import 'package:appsfit/shared/providers/favoriteProvider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Fits>> seachFits(String keyUser, String result) async {
    try {
      /*Response response =
          await ApiClient.listFits(endpoint: AppConstants.todoEndpointSearchFits, result: result);*/

      final url = Uri.https(AppConstants.url, '/api/home/buscarcentrosfitness');
      // var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

      final params = {
        "DefaultKey": keyUser, //TODO: reemplazar por degaulkey logeado
        "SubDominio": result
      };

      //final jsonString = json.encode(params);

      var response = await http.post(url,
          body: params, encoding: Encoding.getByName("UTF-8"));

      final searchFits = SearchFits.fromJson(response.body);

      if (searchFits.status == 0) {
        return searchFits.date!;
      } else if (searchFits.status == 1) {
        print(searchFits.message1);
      } else if (searchFits.status == 2) {
        print(searchFits.message1);
      }
      return searchFits.date!;
    } catch (err, stacktarce) {
      print("API SERVICE POST ERROR : $err");
      print(stacktarce);
      // ignore: null_check_always_fails
      return null!;
    }
  }

  static Future<List<Details>> listDetails(
      String keyUser, String keyEmpresa) async {
    try {
      final url =
          Uri.https(AppConstants.url, '/api/estate/listarmembresiassocio');
      var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

      final params = {
        "DefaultKeyUser": keyUser, //TODO: reemplazar por degaulkey logeado
        "DefaultKeyEmpresa": keyEmpresa
      };

      final jsonString = json.encode(params);

      var response = await http.post(url,
          body: jsonString,
          headers: headers,
          encoding: Encoding.getByName("UTF-8"));
      final listDetail = DetailsFits.fromJson(response.body);

      if (listDetail.status == 0) {
        return listDetail.date!;
      }

      return listDetail.date!;
    } catch (err, stacktarce) {
      print("API SERVICE POST ERROR : $err");
      print(stacktarce);
      return [];
    }
  }

  static Future<List<Favorite>> listFavorite(String result) async {
    try {
      final url = Uri.https(
          AppConstants.url, '/api/home/listarcentrosfitnessfavoritos');
      var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

      final params = {
        "DefaultKeyUser": result //TODO: reemplazar por degaulkey logeado
      };

      final jsonString = json.encode(params);

      var response = await http.post(url,
          body: jsonString,
          headers: headers,
          encoding: Encoding.getByName("UTF-8"));

      final listFavorite = FavoriteFits.fromJson(response.body);

      print("llamada api favoritossss");

      if (listFavorite.status == 0) {
        // FavoriteProvider().favoriteFit = listFavorite.date;

        return listFavorite.date;
      } else if (listFavorite.status == 1) {
        print(listFavorite.message1);
      } else if (listFavorite.status == 2) {
        print(listFavorite.message1);
      }

      return listFavorite.date;
    } catch (err, stacktarce) {
      print("API SERVICE POST ERROR : $err");
      print(stacktarce);
      return [];
    }
  }

  static Future<List<Favorite>> getApiFavorites(String result) async {
    try {
      final url = Uri.https(
          AppConstants.url, '/api/home/listarcentrosfitnessfavoritos');
      var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      final params = {
        "DefaultKeyUser": result //TODO: reemplazar por degaulkey logeado
      };
      final jsonString = json.encode(params);
      var response = await http.post(url,
          body: jsonString,
          headers: headers,
          encoding: Encoding.getByName("UTF-8"));

      final listFavorite = FavoriteFits.fromJson(response.body);
      print("----call api favorites---");
      if (listFavorite.status == 0) {
        return listFavorite.date;
      }
      return listFavorite.date;
    } catch (err, stacktarce) {
      return [];
    }
  }

  static Future addFavorite(String keyUser, String keyEmpresa,
      BuildContext context, int estado) async {
    try {
      final url = Uri.https(
          AppConstants.url, '/api/home/centrosfitness_agregarfavorito');
      var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

      final params = {
        "DefaultKeyUser": keyUser,
        "DefaultKeyEmpresa": keyEmpresa,
        "Estado": estado
      };

      final jsonString = json.encode(params);

      var response = await http.post(url,
          body: jsonString,
          headers: headers,
          encoding: Encoding.getByName("UTF-8"));

      final listFavorite = FavoriteFits.fromJson(response.body);

      print(response.body);

      // Navigator.pop(context); //pop dialog
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(listFavorite.message1),
        backgroundColor: FitAppTheme.bgColor2,
      ));

      if (listFavorite.status == 0) {
        return listFavorite.message1;
      } else if (listFavorite.status == 1) {
        print(listFavorite.message1);
      } else if (listFavorite.status == 2) {
        print(listFavorite.message1);
      }

      return listFavorite.message1;
    } catch (err, stacktarce) {
      print("API SERVICE POST ERROR : $err");
      print(stacktarce);
      return [];
    }
  }
}
