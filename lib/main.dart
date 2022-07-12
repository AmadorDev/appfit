import 'package:appsfit/shared/api/apiServices.dart';
import 'package:appsfit/shared/providers/favoriteProvider.dart';
import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/view/confirm/emailConfirmView.dart';
import 'package:appsfit/view/details/detailsFitsView.dart';
import 'package:appsfit/view/home/bottomNavigationView.dart';
import 'package:appsfit/view/home/homeView.dart';
import 'package:appsfit/view/home/navigationHomeView.dart';
import 'package:appsfit/view/signin/loginView.dart';
import 'package:appsfit/view/signin/test.dart';
import 'package:appsfit/view/signup/signupView.dart';
import 'package:appsfit/view/splash/splashScreenView.dart';
import 'package:appsfit/view/welcome/welcomeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferencesUser();
  await prefs.initPref();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => FitsProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fits',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        'example': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
        'welcome': (BuildContext context) => WelcomeScreen(),
        'registro': (BuildContext context) => SignupPage(),
        'confirm': (BuildContext context) => ConfirmPage(),
        'home': (BuildContext context) => NavigationHomeScreen(),
        'detailFits': (BuildContext context) => DetailsFitsPage(),
        'BottonPage': (BuildContext context) => BottonNavigationPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
        //  fontFamily: "Coresans"
      ),
    );
  }
}
