// To parse this JSON data, do
//
//     final bookingResponse = bookingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:appsfit/shared/models/bookings/Room.dart';

class RoomResponse {
  RoomResponse({
    this.message1,
    this.message2,
    this.status,
    this.date,
  });

  String? message1;
  String? message2;
  int? status;
  List<Room>? date;

  factory RoomResponse.fromJson(String str) =>
      RoomResponse.fromMap(json.decode(str));

  factory RoomResponse.fromMap(Map<String, dynamic> json) => RoomResponse(
        message1: json["Message1"],
        message2: json["Message2"],
        status: json["Status"],
        date: json["Date"] != null
            ? List<Room>.from(json["Date"].map((x) => Room.fromMap(x)))
            : [],
      );
}
