import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/shared/utils/widgets/sizeConfig.dart';
import 'package:flutter/material.dart';
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
const String kEmailNullError = "Por favor introduzca su correo electrónico";
const String kInvalidEmailError = "Por favor, introduzca un correo electrónico válido";
const String kPassNullError = "Por favor, introduzca su contraseña";
const String kPassCompNullError = "La ontraseña ingresada no coinciden";
const String kNameNullError = "Por favor, introduzca su Nombre";
const String kLastNameNullError = "Por favor, introduzca su Apellido";
const String kShortPassError = "La contraseña es demasiado corta";
const String kShortDNIError = "El DNI/CE/CC es demasiado corta";
const String kMatchPassError = "Las contraseñas no coinciden";
const String kNamelNullError = "Por favor, escriba su nombre";
const String kPhoneNumberNullError = "Por favor, introduzca su número de whatsapp";
const String kAddressNullError = "Por favor ingrese su direccion";
const String kShortNameError = "Nombre tiene pocos caracteres admitidos";


final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: FitAppTheme.bgColor),
  );
}

String? validatePassword(String value, TextEditingController _controllerPassword) {
 print("valorrr $value passsword ${_controllerPassword.text}");
 if (value != _controllerPassword.text) {
   return "Las contraseñas no coinciden";
 }
 return null;
}