import 'package:appsfit/shared/providers/favoriteProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  static final PreferencesUser _instancia = new PreferencesUser._internal();

  factory PreferencesUser() {
    return _instancia;
  }

  PreferencesUser._internal();
  late SharedPreferences _prefs;
  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //get y set IdUsuario
  String get id {
    return _prefs.getString('id') ?? '0';
  }

  set id(String value) {
    _prefs.setString('id', value);
  }

  //get y set defaultKey
  String get defaulkey {
    return _prefs.getString('DefaultKey') ?? '0';
  }

  set defaulkey(String value) {
    _prefs.setString('DefaultKey', value);
  }

  //get y set nombreUsuario

  String get nombre {
    return _prefs.getString('nombre') ?? 'SN';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  //get y set email

  String get email {
    return _prefs.getString('email') ?? 'SN';
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  //get y set emailConfirmed

  String get emailConfirmed {
    return _prefs.getString('emailConfirmed') ?? 'SN';
  }

  set emailConfirmed(String value) {
    _prefs.setString('emailConfirmed', value);
  }

  //get y set estadoLoginUsuario

  bool get status {
    return _prefs.getBool('status') ?? false;
  }

  set status(bool value) {
    _prefs.setBool('status', value);
  }
}
