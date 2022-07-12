import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/models/user/userResponse.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/shared/utils/widgets/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:appsfit/shared/providers/loginProvider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ScreenScaler scale = ScreenScaler();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FitAppTheme.bgColor,
                FitAppTheme.bgColor2,
              ],
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 36.0,
                        horizontal: 24.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/ic_logowhite.png',
                            height: scale.getFullScreen(25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _obscureText = true;
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerDni = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  //final prefs = new PreferencesUser();

  @override
  void initState() {
    // TODO: implement initState
    _controllerEmail = TextEditingController();
    _controllerDni = TextEditingController();
    _controllerPassword = TextEditingController();
    super.initState();
  }

  Future _loginUser() async {
    //await Future.delayed(const Duration(seconds: 3));
    //var url = AppConstants.url+AppConstants.todoEndpointLogin;
    final params = {
      "Email": _controllerEmail.text.trim(),
      "UserName": _controllerDni.text.trim(),
      "PasswordHash": _controllerPassword.text.trim()
    };

    var url2 = Uri.https(AppConstants.url, '/api/access/loginpersonafit');
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    };

    final jsonString = json.encode(params);

    var response = await http.post(url2,
        headers: headers,
        body: jsonString,
        encoding: Encoding.getByName("UTF-8"));
    //jsonDecode(utf8.decode(response.bodyBytes));

    // print(json.encode(response.body));

    final decodedData = UserAcount.fromJson(response.body);

    Navigator.pop(context); //pop dialog
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(decodedData.message1),
      backgroundColor: FitAppTheme.bgColor2,
    ));

    if (decodedData.status == 0) {
      saveData(decodedData);
      if (decodedData.date!.emailConfirmed == true) {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      } else if (decodedData.date!.emailConfirmed == false) {
        Navigator.pushNamedAndRemoveUntil(context, 'confirm', (route) => false);
      }
    } else if (decodedData.status == 1) {
      Navigator.pop(context); //pop dialog

    } else if (decodedData.status == 2) {
      Navigator.pop(context); //pop dialog

    }
  }

  saveData(UserAcount data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', data.date!.id);
    prefs.setString('DefaultKey', data.date!.defaultKey);
    prefs.setString('nombre', data.date!.fullName);
    prefs.setString('email', data.date!.email);
    prefs.setString('emailConfirmed', data.date!.emailConfirmed.toString());
    prefs.setBool('status', true);

    // print('ID USER: ${model.id.toString()}');
    // print('NAME: ${model.name.toString()}');
    // toastMessage('${prefs.nombre}');
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Iniciar Sesión", style: FitAppTheme.title)),
          Spacer(),
          TextFormField(
            cursorColor: FitAppTheme.bgColor,
            controller: _controllerEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Color(0xFFe7edeb),
              hintText: 'demo@gmail.com',
              labelText: "Correo Electrónico",
              labelStyle: FitAppTheme.description,
              prefixIcon:
                  Icon(Icons.alternate_email_sharp, color: FitAppTheme.black),
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              return emailValidatorRegExp.hasMatch(value ?? '')
                  ? ''
                  : kInvalidEmailError;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            cursorColor: FitAppTheme.bgColor,
            controller: _controllerDni,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Color(0xFFe7edeb),
              hintText: 'DNI/CE/CC',
              labelText: "DNI/CE/CC",
              labelStyle: FitAppTheme.description,
              prefixIcon:
                  Icon(Icons.account_circle_outlined, color: FitAppTheme.black),
            ),
            onChanged: (value) => loginForm.dni = value,
            validator: (value) {
              return (value != null && value.length >= 8)
                  ? null
                  : kShortDNIError;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            cursorColor: FitAppTheme.bgColor,
            obscureText: _obscureText,
            controller: _controllerPassword,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Color(0xFFe7edeb),
              hintText: '*********',
              labelText: "Contraseña",
              labelStyle: FitAppTheme.description,
              prefixIcon: Icon(Icons.lock_outline, color: FitAppTheme.black),
              suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: FitAppTheme.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }),
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 4)
                  ? null
                  : kPassNullError;
            },
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: FitAppTheme.bgColor2,
                //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  loginForm.isLoading ? 'Espere...' : "Iniciar sesión",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              onPressed: () async {
                //Navigator.of(this.context).pushReplacementNamed('menu');
                //  _loginForm();
                //if(!loginForm.isValidForm() ) return;
                // loginForm.isLoading = true;
                //quitar el teclado

                // loginForm.isLoading = false;
                // FocusScope.of(context).unfocus();
                // _loginUser();
                //Future.delayed(Duration(seconds: 2));

                //loginForm.isLoading = false;
                //TODO: falta programar el Loading
                if (_controllerEmail.text.isEmpty ||
                    _controllerPassword.text.isEmpty ||
                    _controllerDni.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Ingresa todo los datos"),
                    backgroundColor: FitAppTheme.bgColor,
                  ));
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                            child: Container(
                          height: 120.0,
                          width: 200.0,
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Validando Usuario..',
                                )
                              ],
                            ),
                          ),
                        ));
                      });

                  new Future.delayed(new Duration(seconds: 2), () {});
                  await _loginUser();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
