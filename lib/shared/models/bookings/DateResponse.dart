// To parse this JSON data, do
//
//     final dateResponse = dateResponseFromMap(jsonString);

import 'dart:convert';

import 'package:appsfit/shared/models/bookings/DateModel.dart';

class DateResponse {
  DateResponse({
    this.message1,
    this.message2,
    this.status,
    this.date,
  });

  String? message1;
  String? message2;
  int? status;
  List<DateModel>? date;

  factory DateResponse.fromJson(String str) =>
      DateResponse.fromMap(json.decode(str));

  factory DateResponse.fromMap(Map<String, dynamic> json) => DateResponse(
        message1: json["Message1"],
        message2: json["Message2"],
        status: json["Status"],
        date: json["Date"] != null
            ? List<DateModel>.from(
                json["Date"].map((x) => DateModel.fromMap(x)))
            : [],
      );
}
