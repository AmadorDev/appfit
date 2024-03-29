import 'package:flutter/material.dart';

class SignupFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String name = '';
  String lastname = '';
  String email = '';
  String dni = '';
  String password = '';
  String passwordcomp = '';
  String country = '';
  String whatsapp = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
