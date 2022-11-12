import 'package:appsfit/shared/models/general.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:flutter/material.dart';
import 'package:appsfit/shared/models/favorite/favoriteModel.dart';
import 'package:appsfit/shared/api/apiServices.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Favorite> onFavoriteFits = [];
  Favorite? favorite;
  String keyUser = '';
  final prefs = new PreferencesUser();

  set favoriteFit(List<Favorite> sa) {
    onFavoriteFits = sa;
    notifyListeners();
  }

  Future<void> favoritFit(List<Favorite> s) async {
    onFavoriteFits = s;
    notifyListeners();
  }

  getFavorites(String keyUser) async {
    final resp = await ApiServices.getApiFavorites("${keyUser}");
    onFavoriteFits = resp;
    print(
        "---------------------get favorites provider ${onFavoriteFits.length} -------");

    notifyListeners();
  }

  Future<List<Favorite>>? getFavoritesFuture(String keyUser) async {
    print(onFavoriteFits.length);
    if (onFavoriteFits.length > 0) return onFavoriteFits;
    final resp = await ApiServices.getApiFavorites("${keyUser}");
    print(resp);
    onFavoriteFits = resp;
    notifyListeners();
    return resp;
  }

  Future<void> stateFavorite(String keyUser, String keyEmpresa,
      BuildContext context, int estado, General favorite) async {
    if (estado == 1) {
      //add
      final resp = await ApiServices.addFavorite(
          '${keyUser}', '${keyEmpresa}', context, estado);

      onFavoriteFits.add(new Favorite(
          nombreComercialEmpresa: favorite.nombreComercialEmpresa,
          logoTipo: favorite.logoTipo,
          defaultKeyEmpresa: favorite.defaultKeyEmpresa,
          defaultKeyUser: favorite.defaultKeyUser));
      print(onFavoriteFits[0].defaultKeyEmpresa);

      notifyListeners();
    } else {
      //remove
      final resp = await ApiServices.addFavorite(
          '${keyUser}', '${keyEmpresa}', context, estado);
      print("remove lent ${onFavoriteFits.length}");
      onFavoriteFits.removeWhere((fa) => fa.defaultKeyEmpresa == keyEmpresa);
      print("remove lent ${onFavoriteFits.length}");
      notifyListeners();
    }
  }
}
