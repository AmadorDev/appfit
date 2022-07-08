// To parse this JSON data, do
//
//     final favoriteFits = favoriteFitsFromMap(jsonString);

import 'dart:convert';

import 'package:appsfit/shared/models/favorite/favoriteModel.dart';

class FavoriteFits {
    FavoriteFits({
        required this.message1,
        required this.message2,
        required this.status,
        required this.date,
    });

    String message1;
    String message2;
    int status;
    List<Favorite> date;

    factory FavoriteFits.fromJson(String str) => FavoriteFits.fromMap(json.decode(str));


    factory FavoriteFits.fromMap(Map<String, dynamic> json) => FavoriteFits(
        message1: json["Message1"],
        message2: json["Message2"],
        status: json["Status"],
        date: json["Date"] !=null ? List<Favorite>.from(json["Date"].map((x) => Favorite.fromMap(x))) : [],
    );

}

