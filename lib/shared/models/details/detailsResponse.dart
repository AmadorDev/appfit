
import 'dart:convert';
import 'package:appsfit/shared/models/details/detailsModel.dart';

class DetailsFits {
    DetailsFits({
        required this.message1,
        required this.message2,
        required this.status,
         this.date,
    });

    String message1;
    String message2;
    int status;
    List<Details>? date;

    factory DetailsFits.fromJson(String str) => DetailsFits.fromMap(json.decode(str));

    factory DetailsFits.fromMap(Map<String, dynamic> json) => DetailsFits(
        message1: json["Message1"] as String,
        message2: json["Message2"] as String,
        status: json["Status"] as int,
        date: json["Date"] !=null ? List<Details>.from(json["Date"].map((x) => Details.fromMap(x))) : [],
    );

}

