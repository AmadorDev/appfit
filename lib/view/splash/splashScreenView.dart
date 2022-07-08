import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/confirm/emailConfirmView.dart';
import 'package:appsfit/view/home/homeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
      ScreenScaler scale = ScreenScaler();
      final prefs = new PreferencesUser();

  @override
  void initState() {
    super.initState();
   

    if (prefs.id == "0"){
           _navigatorWelcome();
    }else{
       if(prefs.emailConfirmed == "true"){
        //Navigator.of(this.context).pushReplacementNamed('home');
      // Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      _navigatorMenu();
      }else if(prefs.emailConfirmed == "false"){
        _navigatorLogin();
               // Navigator.of(this.context).pushReplacementNamed('confirm');

          //Navigator.pushNamedAndRemoveUntil(context, 'confirm', (route) => false);

      }
    }
    
  
  }
Future<bool> _navigatorMenu()async {
  await Future.delayed(Duration(milliseconds: 3000),(){
   _navigationMenu();

  });
  return prefs.status;
}

 Future<bool> _navigatorWelcome()async {
  await Future.delayed(Duration(milliseconds: 3000),(){
   _navigationWelcome();

  });
  return prefs.status;
}

Future<bool> _navigatorLogin()async {
  await Future.delayed(Duration(milliseconds: 3000),(){
   Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);

  });
  return prefs.status;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _pagina(),
      ),
    );
  }

  Future<bool> _checkInicioSession()async {
  await Future.delayed(Duration(milliseconds: 3000),(){
   _navigationWelcome();

  });
    
  return prefs.status;
}

void _navigationLogin(){
  Navigator.of(this.context).pushReplacementNamed('login');
} 
void _navigationWelcome(){
  Navigator.of(this.context).pushReplacementNamed('welcome');
} 
void _navigationMenu(){
  Navigator.of(this.context).pushReplacementNamed('home');
} 

Widget _pagina(){
  return Stack(
    children: <Widget> [
      _colorFondo(),
      
      _texto(),
    ],
  );
}

Widget _colorFondo(){
  return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            colors: [
              FitAppTheme.black,
              FitAppTheme.black,
              FitAppTheme.black
            ]
          
        )
      ),
 
    );

}

Widget _texto(){

  return Container(
    width: double.infinity,
    height: double.infinity,
    child:Center(
     child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Image.asset('assets/ic_logocolor.png', height: scale.getFullScreen(25),),
          SizedBox(
            height: 80.0,
          ),
          Text("Loading....", style: TextStyle(color: Colors.white, fontSize: 22.0), textAlign: TextAlign.center,),
          Spacer(),
          Text("From", style: TextStyle(color: Colors.white, fontSize: 15.0), textAlign: TextAlign.center,),
          Text("Appsfit Software", style: TextStyle(color: Colors.white, fontSize: 15.0), textAlign: TextAlign.center,),
         
          Container(
            height: 10,
          )
                                       
        ],
     ),
    ),
    );

}

}