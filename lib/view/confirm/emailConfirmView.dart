import 'package:appsfit/shared/models/user/userResponse.dart';
import 'package:appsfit/view/home/homeView.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:http/http.dart' as http;

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  ScreenScaler scale = ScreenScaler();
  final prefs = new PreferencesUser();

  final _formKey = GlobalKey();

  final _controllerEmail = TextEditingController();
  var _text = '';

  String? get _errorText {
    final text = _controllerEmail.value.text;
    if (text.isEmpty) {
      return 'correo electrónico requerido';
    } else {
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(text))
        return 'Introduzca una dirección de correo electrónico válida';
      else
        return '';
    }
  }

  @override
  void initState() {
    _controllerEmail.text = prefs.email;
    _text = prefs.email;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerEmail.dispose();
    super.dispose();
  }

  Future _sendEmail() async {
    //await Future.delayed(const Duration(seconds: 3));
    //var url = AppConstants.url+AppConstants.todoEndpointLogin;
    final params = {
      "id": prefs.id,
      "email": _text,
    };
    

    var url2 =
        Uri.https(AppConstants.url, '/api/access/reenviarcorreopersonafit');
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    };

    final jsonString = json.encode(params);

    var response = await http.post(url2,
        headers: headers,
        body: jsonString,
        encoding: Encoding.getByName("UTF-8"));

    final decodedData = UserAcount.fromJson(utf8.decode(response.bodyBytes));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(decodedData.message1),
      backgroundColor: FitAppTheme.colorButtonL,
    ));

    if (decodedData.status == 0) {
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
      prefs.emailConfirmed = "true";
    } else if (decodedData.status == 1) {
      Navigator.pop(context);
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [FitAppTheme.bgColor, FitAppTheme.bgColor2]),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/ic_logowhite.png',
                        height: scale.getFullScreen(25),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Para continuar solo falta confirmar tu correo",
                          style: FitAppTheme.title2White),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Ingresa a tu correo y confirma que el correo te pertenece, si no llego el correo puedes volcer a reenviar",
                        style: FitAppTheme.descriptionWhite,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        maxLines: null,
                        cursorColor: FitAppTheme.bgColor,
                        controller: _controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color(0xFFe7edeb),
                            hintText: 'Correo Electrónico',
                            // labelText: "Correo Electrónico",
                            labelStyle: FitAppTheme.description,
                            prefixIcon: Icon(Icons.alternate_email_sharp,
                                color: FitAppTheme.black),
                            errorText: _errorText,
                            errorStyle: TextStyle(color: Colors.white)),
                        onChanged: (v) {
                          setState(() {
                            _text = v;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: Text('Reenviar Correo'),
                        onPressed: () async {
                          _sendEmail();
                        },
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: FitAppTheme.colorButtonL,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: FitAppTheme.button),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        child: Text('Login'),
                        onPressed: () async {
                          Navigator.restorablePushNamed(context, 'login');
                        },
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: FitAppTheme.colorButtonL,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: FitAppTheme.button),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       height: MediaQuery.of(context).size.height,
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             begin: Alignment.topCenter,
    //             colors: [FitAppTheme.bgColor, FitAppTheme.bgColor2]),
    //       ),
    //       child: Column(
    //         children: [
    //           Expanded(
    //             flex: 1,
    //             child: Container(
    //               child: Image.asset(
    //                 'assets/ic_logowhite.png',
    //                 height: scale.getFullScreen(25),
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             flex: 1,
    //             child: Container(
    //               margin: EdgeInsets.all(20),
    //               child: 
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
 
