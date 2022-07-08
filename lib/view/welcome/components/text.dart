import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';


class TextWelcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text("Al iniciar sesión o registrarse, ha aceptado los términos y condiciones y la política de privacidad",
            style: FitAppTheme.descriptionWhite,
            textAlign: TextAlign.center
          ),
        ),
      ],
    );
  }
}