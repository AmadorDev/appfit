
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

import 'components/divider.dart';
import 'components/signinButtons.dart';
import 'components/text.dart';



class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ScreenScaler scale = ScreenScaler();

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 25),
                Image.asset('assets/ic_logowhite.png', height: scale.getFullScreen(25),),
                const SizedBox(height: 45),
                _textWelcome(),
                const SizedBox(height: 25),
                _textNote(),
                SizedBox(height: scale.getHeight(1)),
                Spacer(),
                SignButtons(),
                const SizedBox(height: 25),
                MyDivider(scale),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextWelcome()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textWelcome(){
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
       Expanded(
         child: Text("Bienvenido",
         style: FitAppTheme.titleWhite,
          textAlign: TextAlign.center
        ),
       ),
       ],
     );
  }

  Widget _textNote(){
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
       Expanded(
         child: Text("Antes de disfrutar de los servicios de Appsfit registrese primero.",
         style: FitAppTheme.descriptionWhite,
          textAlign: TextAlign.center
        ),
       ),
       ],
     );
  }
}