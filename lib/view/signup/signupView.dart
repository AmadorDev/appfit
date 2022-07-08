
import 'dart:convert';
import 'dart:io';

import 'package:appsfit/shared/constants/conts.dart';
import 'package:appsfit/shared/models/user/userResponse.dart';
import 'package:appsfit/shared/providers/signupProvider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/shared/utils/widgets/validation.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                flex: 1,
                child: Stack(
                  children: [
                    Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 14.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/ic_logowhite.png', height: scale.getFullScreen(20),),
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
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child:  
                    ChangeNotifierProvider(
                      create: ( _ ) => SignupFormProvider() ,
                      child:_SignUpForm(),
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

class _SignUpForm extends StatefulWidget {
  
  @override
  _SignUpFormState createState() => _SignUpFormState();
}


class _SignUpFormState extends State<_SignUpForm> {
  bool _obscureText = true;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerDni = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerComparePassword = TextEditingController();
  TextEditingController _controllerCountry = TextEditingController();
  TextEditingController _controllerWhatsapp = TextEditingController();

  @override
  void initState() {
    _controllerName =TextEditingController();
    _controllerLastName = TextEditingController();
    _controllerDni = TextEditingController();
    _controllerEmail =TextEditingController();
    _controllerPassword = TextEditingController();
    _controllerComparePassword = TextEditingController();
    _controllerCountry = TextEditingController();//defecto 51
    _controllerWhatsapp = TextEditingController();
    super.initState();
    
  }



Future _getSignUpUser() async {
  final countryValue = _controllerCountry.text.replaceAll("+", "");
  final paramssignin = {
    "FullName" : "${_controllerName.text.trim()} ${_controllerLastName.text.trim()}",
    "UserName" : "${_controllerDni.text.trim()}",
    "PasswordHash" : "${_controllerPassword.text.trim()}",
    "Email" : "${_controllerEmail.text.trim()}",
    "PhoneNumber" : "$countryValue${_controllerWhatsapp.text.trim()}"
  };


 var url2 = Uri.https(AppConstants.url, '/api/access/registrarpersonafit');
 var headers = {HttpHeaders.contentTypeHeader: 'application/json'};

 final jsonString = json.encode(paramssignin);
 var response = await http.post(url2, headers: headers, body: jsonString);

  final decodedData = UserAcount.fromJson(response.body);

  Navigator.pop(context); //pop dialog
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: Text(decodedData.message1),
   backgroundColor: FitAppTheme.bgColor2,
  ));

  print(paramssignin);
  if (decodedData.status == 0){
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
  
  }else if  (decodedData.status == 1){
    Navigator.pop(context); //pop dialog

  }else if  (decodedData.status == 2){
    Navigator.pop(context); //pop dialog

  }
 
    //print(paramssignin);

    //correcto
    //Navigator.of(context).pushReplacementNamed('login');
}

  @override
  Widget build(BuildContext context) {
  final signupForm = Provider.of<SignupFormProvider>(context);

    return Form(
  key: signupForm.formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("Registrese", style: FitAppTheme.title),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("Registrese es gratis y solo toma un minuto", style: FitAppTheme.description),
                SizedBox(
                  height: 20.0,
                ),
               TextFormField(
                  cursorColor: FitAppTheme.bgColor,
                  controller: _controllerName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none
                      
                      
                    ),
                   
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: 'Ingrese Nombres',
                    labelText: "Ingrese Nombres",
                    labelStyle: FitAppTheme.description,
                    prefixIcon: Icon(
                      Icons.account_circle_outlined, 
                      color: FitAppTheme.black
                      ),
                  ),
                  onChanged: (value) => signupForm.name = value,
                  validator: (value){
                   return ( value != null && value.length >= 1 ) 
                      ? null
                      : kShortNameError;   
            
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  cursorColor: FitAppTheme.bgColor,
                  controller: _controllerLastName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none
                      
                      
                    ),
                   
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: 'Ingrese Apellidos',
                    labelText: "Ingrese Apellidos",
                  
                    labelStyle: FitAppTheme.description,
                    prefixIcon: Icon(
                      Icons.account_circle_outlined, 
                      color: FitAppTheme.black
                      ),
                  ),
                  onChanged: (value) => signupForm.lastname = value,
                  validator: (value){
                   return ( value != null && value.length >= 1 ) 
                      ? null
                      : kLastNameNullError;   
            
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
                      borderSide: BorderSide.none
                      
                      
                    ),
                   
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: 'DNI/CE/CC',
                    labelText: "DNI/CE/CC",
                  
                    labelStyle: FitAppTheme.description,
                    prefixIcon: Icon(
                      Icons.account_circle_outlined, 
                      color: FitAppTheme.black
                      ),
                  ),
                  onChanged: (value) => signupForm.dni = value,
                  validator: (value){
                   return ( value != null && value.length >= 8 ) 
                      ? null
                      : kShortDNIError;   
            
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  cursorColor: FitAppTheme.bgColor,
                  controller: _controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none
                    ),
                   
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: 'demo@gmail.com',
                    labelText: "Correo Electrónico",
                  
                    labelStyle: FitAppTheme.description,
                    prefixIcon: Icon(
                      Icons.alternate_email_sharp, 
                      color: FitAppTheme.black
                      ),
                  ),
                  onChanged: (value) => signupForm.email = value,
                  validator: (value){
                    
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
                  obscureText: _obscureText,
                  controller: _controllerPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none
                      
                    ),
                    
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: '*********',
                    labelText: "Contraseña",
                    labelStyle: FitAppTheme.description,
                    prefixIcon: Icon(
                      Icons.lock_outline, 
                      color: FitAppTheme.black
                      ),

                    suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                      color:  FitAppTheme.black,
                      ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                          _obscureText = !_obscureText;
                      });
                    }
                   ),
                  ),
                  onChanged: (value) => signupForm.password = value,
                  validator: (value){
                    return ( value != null && value.length >= 4 ) 
                      ? null
                      : kPassNullError;       
                      
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  cursorColor: FitAppTheme.bgColor,
                  obscureText: _obscureText,
                  controller: _controllerComparePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none
                      
                    ),
                    
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: '*********',
                    labelText: "Confirmar su contraseña",
                    labelStyle: FitAppTheme.description,
                    prefixIcon: Icon(
                      Icons.lock_outline, 
                      color: FitAppTheme.black
                      ),

                     suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                      color:  FitAppTheme.black,
                      ),
                    onPressed: () {
                      setState(() {
                          _obscureText = !_obscureText;
                      });
                    }
                   ),
                  ),
                  onChanged: (value) => signupForm.passwordcomp = value,
                  validator: (value){
                    return ( value != null && value ==_controllerPassword.text) 
                      ? null
                      : kPassCompNullError;       
                      
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                
                Center(
                  child: 
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: Color(0xFFe7edeb),
                      ),

                      child: CountryCodePicker(
                        initialSelection: 'PE',
                        showCountryOnly: true,
                        showFlagDialog: true,
                        hideMainText: false,
                        favorite: ['+51','PE'],
                        showFlagMain: true,//ocultar icon luego de seleccion
                        alignLeft: true,
                        onInit: (code) => _controllerCountry.text = '${code!.dialCode.toString()}',
                        onChanged: (value) => _controllerCountry.text = value.dialCode.toString(),

                      ),
                    )
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  cursorColor: FitAppTheme.bgColor,
                  controller: _controllerWhatsapp,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none
                      
                      
                    ),
                   
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: 'Ingrese Whatsapp',
                    labelText: "Ingrese Whatsapp",
                  
                    labelStyle: FitAppTheme.description,
                    prefixIcon: Icon(
                      Icons.call_outlined, 
                      color: FitAppTheme.black
                      ),
                  ),
                  onChanged: (value) => signupForm.whatsapp = value,
                  validator: (value){
                   return ( value != null && value.length >= 9 ) 
                      ? null
                      : kPhoneNumberNullError;   
            
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                
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
                        signupForm.isLoading
                        ? 'Registrando...'
                        : "Completar registro",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0
                         ),
                        ),
                    ),
                     onPressed: () async{
                       //Navigator.of(this.context).pushReplacementNamed('menu');
                     //  _loginForm();
                     //if(!signupForm.isValidForm() ) return;
                     //signupForm.isLoading = true;
                     //quitar el teclado
                    // FocusScope.of(context).unfocus();
                    // loginForm.isLoading = false;
                    //Future.delayed(Duration(seconds: 2));
            
                     //loginForm.isLoading = false;
                     //TODO: falta programar el Loading
                if (_controllerName.text.isEmpty || _controllerLastName.text.isEmpty || _controllerDni.text.isEmpty || _controllerEmail.text.isEmpty 
                   || _controllerPassword.text.isEmpty || _controllerComparePassword.text.isEmpty || _controllerWhatsapp.text.isEmpty){
                //${_controllerName.text} ${_controllerLastName.text}
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Ingresa todo los datos"),
                      backgroundColor: FitAppTheme.bgColor2,
                    ));
                 }else{

                
              showDialog(
                 context: context,
                 builder: (BuildContext context) {
                  return  Center(
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
                          Text('Registrando Usuario..',)
                          ],
                          ),
                        ),
                        ) 
                        );
                      });
                      
                    new Future.delayed(new Duration(seconds: 2), () {
                    
                      });
                          await _getSignUpUser();
                      }
                    }
                  ),
                )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
