import 'package:flutter/material.dart';
import 'package:appsfit/shared/models/favorite/favoriteModel.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Favorite> onFavoriteFits = [];
  Favorite? favorite;
  String keyUser = '';

  List<Favorite> get favoriteFit => onFavoriteFits;

  set favoriteFit(List<Favorite> sa) {
    onFavoriteFits = sa;
    notifyListeners();
  }

  Future<void> favoritFit(List<Favorite> s) async {
    onFavoriteFits = s;
    notifyListeners();
  }

  Future<void> removeFavoriteById(String? key) async {
    // onFavoriteFits.removeWhere((fa) => fa.defaultKeyEmpresa == key);
    final indexFa =
        onFavoriteFits.indexWhere((fa) => fa.defaultKeyEmpresa == key);
    if (indexFa != -1) {
      onFavoriteFits.removeAt(indexFa);
      notifyListeners();
    }
  }
}
