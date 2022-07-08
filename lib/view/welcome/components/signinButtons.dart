import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/signin/loginView.dart';
import 'package:appsfit/view/signup/signupView.dart';
import 'package:flutter/material.dart';


class SignButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    
    Future navigate(widget) => Navigator.push(context, MaterialPageRoute(builder: (_) => widget));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            child: Text('Registrese'),
            onPressed: () => navigate(SignupPage()),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), //border
                primary: FitAppTheme.bgColor2,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: FitAppTheme.button
                ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
            child: Text('Iniciar sesion'),
            onPressed: () => navigate(LoginPage()),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: FitAppTheme.colorButtonL,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: FitAppTheme.button
                ),
        ),
      ],
    );
  }


}
