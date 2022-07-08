import 'dart:convert';
import 'package:appsfit/shared/models/search/searchModel.dart';

class SearchFits {
    SearchFits({
        required this.message1,
        required this.message2,
        required this.status,
        required this.date,
    });

    String message1;
    String message2;
    int status;
    List<Fits>? date;
 
   factory SearchFits.fromJson(String str) => SearchFits.fromMap(json.decode(str));

   factory SearchFits.fromMap(Map<String, dynamic> json) => SearchFits(
        message1: json["Message1"] as String,
        message2: json["Message2"] as String,
        status: json["Status"] as int,
        date: json["Date"] !=null ? List<Fits>.from(json["Date"].map((x) => Fits.fromMap(x))) : [],
    );

  /* factory SearchFits.fromJson(Map<String, dynamic> json) => SearchFits(
        message1: json["Message1"] as String,
        message2: json["Message2"] as String,
        status: json["Status"] as int, 
        date: json["Date"],
      );
     
    static List<SearchFits> fromList(List list) {
      List<SearchFits> todoList = [];
      if (list is List)
        list.forEach((json) => todoList.add(SearchFits.fromJson(json)));
      return todoList;
    }*/

    /*Map<String, dynamic> toMap() => {
        "Message1": message1,
        "Message2": message2,
        "Status": status,
        "Date": List<dynamic>.from(date.map((x) => x.toMap())),
    };*/
}
