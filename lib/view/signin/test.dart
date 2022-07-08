import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/models/search/serachResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  final params = {
    "Email" : "CARLOSCHAMBERGO15275@GMAIL.COM",
    "UserName" : "09832578",
    "PasswordHash" : "9998"
  };

  final paramssignin = {
    "DefaultKey" : "27690a00-1cb6-4489-83dd-b59b5adbde2b",
    "SubDominio" : "apps"
  };

  UserProvider(){
    print("User provider init");
     //this.getUserAcount();
    //this.getSignUpUser();
  }

Future getUserAcount() async {
    
 var url2 = Uri.https(AppConstants.url, '/api/access/loginpersonafit');
 var headers = {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'};

 final jsonString = json.encode(params);
 var response = await http.post(url2, headers: headers, body: jsonString);

 //final jsonString = json.encode(params);
 //var response2 = await http.post(url2, headers: headers, body: jsonString);

    print(response.body);
  }

Future getSignUpUser() async {
    
 var url2 = Uri.https(AppConstants.url, '/api/home/buscarcentrosfitness');
 var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

 final jsonString = json.encode(paramssignin);
 var response2 = await http.post(url2, headers: headers, body: jsonString, encoding: Encoding.getByName("UTF-8"));
   
  var searc = SearchFits.fromJson(response2.body);
 

    print(searc);
  }

}