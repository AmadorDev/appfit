import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/models/details/detailsModel.dart';
import 'package:appsfit/shared/models/details/detailsResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FitsProvider extends ChangeNotifier {
List<Details> onDetailsFits = [];
Details? detail;
String keyUser = '';
String keyEmpresa = '';

  //GlobalKey<FormState> formKey = new GlobalKey<FormState>();
 /* FitsProvider (){
    
  
   Future.delayed(Duration(milliseconds: 3000),(){
    this.listDetails();
   
    print('Init FitsProvider');
  });
 
    
  }*/
  //Optiene los parametros de details
   keyUse(String keyUse, String keyEmp){
    keyUser = keyUse;
    keyEmpresa = keyEmp;
     
  }

   Future<void> detailsFit(Details? s) async {
    detail = s;
    notifyListeners();
  }
  

    /*listDetails() async {

      try {
            
          final url = Uri.https(AppConstants.url, '/api/estate/listarmembresiassocio');
          var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

          final params = {
              "DefaultKeyUser" : keyUser, //TODO: reemplazar por degaulkey logeado
              "DefaultKeyEmpresa" : keyEmpresa
            };

         final jsonString = json.encode(params);

          var response = await http.post(url,  body: jsonString, headers: headers, encoding: Encoding.getByName("UTF-8"));
          final listDetail = DetailsFits.fromJson(response.body);

          

          if (listDetail.status == 0){
          onDetailsFits = listDetail.date!;
          notifyListeners();
            return listDetail.date! ;
          }
          
          
          return listDetail.date!;

        } catch (err, stacktarce) {
          print("API SERVICE POST ERROR : $err");
          print(stacktarce);
          return [];
        }
    }*/

}