import 'dart:convert';

import 'package:appsfit/shared/models/user/userModel.dart';

class UserAcount {
    UserAcount({
       required this.message1,
       required this.message2,
       required this.status,
       this.date,
    });

    String message1;
    String message2;
    int status;
    UserData? date;

    factory UserAcount.fromJson(String str) => UserAcount.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());
  
    factory UserAcount.fromMap(Map<String, dynamic> json) => UserAcount(
        message1: json["Message1"] as String,
        message2: json["Message2"] as String,
        status: json["Status"] as int,
        date: json["Date"] !=null ? UserData.fromMap(json["Date"]) : null,
    );

    Map<String, dynamic> toMap() => {
        "Message1": message1,
        "Message2": message2,
        "Status": status,
        "Date": date?.toMap(),
    };
}
