import 'package:appsfit/shared/models/user/userResponse.dart';
import 'package:appsfit/view/home/homeView.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:http/http.dart' as http;

class ConfirmPage extends StatefulWidget {

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
   ScreenScaler scale = ScreenScaler();
  final prefs = new PreferencesUser();

  @override
  void initState() {
    super.initState();
  }

  Future _sendEmail() async{
  //await Future.delayed(const Duration(seconds: 3));
    //var url = AppConstants.url+AppConstants.todoEndpointLogin;
   final params = {
    "id" : prefs.id,
  };

 
    
  var url2 = Uri.https(AppConstants.url, '/api/access/reenviarcorreopersonafit');
  var headers = {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'};

  final jsonString = json.encode(params);

  var response = await http.post(url2, headers: headers, body: jsonString, encoding: Encoding.getByName("UTF-8"));
   
  final decodedData = UserAcount.fromJson(response.body);
  
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: Text(decodedData.message1),
   backgroundColor: FitAppTheme.bgColor2,
  ));



  if (decodedData.status == 0){
         Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
         prefs.emailConfirmed = "true";
        

  }else if  (decodedData.status == 1){
    Navigator.pop(context); 

  }
   
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
        children: <Widget> [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                colors: [
                  FitAppTheme.bgColor,
                  FitAppTheme.bgColor2
                ]
                  )
                ),
            ),

            Container(
             padding: const EdgeInsets.all(24),
              child:Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                    SizedBox(
                      height: 60.0,
                    ),
                    Image.asset('assets/ic_logowhite.png', height: scale.getFullScreen(25),),
                    SizedBox(
                      height: 20.0,
                    ),
                     Text("Para continuar solo falta confirmar tu correo", 
                      style: FitAppTheme.title2White),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Ingresa a tu correo y confirma que el correo te pertenece, si no llego el correo puedes volcer a reenviar", 
                    style: FitAppTheme.descriptionWhite,),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                       padding: const EdgeInsets.only(top: 16),
                       child: Container(
                         decoration: BoxDecoration(
                         color: FitAppTheme.secondary,
                         borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                         ),
                        child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                            left: 18, bottom: 12, right: 16, top: 12),
                            child: Text("${prefs.email}",
                              textAlign: TextAlign.start,
                              style: FitAppTheme.description
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                    Spacer(),
                    ElevatedButton(
                    child: Text('Reenviar Correo'),
                    onPressed: () async{
                      _sendEmail();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: FitAppTheme.colorButtonL,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: FitAppTheme.button
                        ),
                ),
                  
                    Container(
                      height: 10,
                    )
                                                
                  ],
              ),
              ),
              ),

          ],
        ),
      ),
    );
  }
}