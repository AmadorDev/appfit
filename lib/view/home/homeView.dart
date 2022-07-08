import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

final prefs = new PreferencesUser();
 bool status = false;

class _HomePageState extends State<HomePage> {
 

@override
void initState(){
  super.initState();

 /*if  (prefs.emailConfirmed == "false"){
    print("mostrar confirm page");
    _confirmEmail();
  }else {
    print("Confirmado mostrar menu");
  }*/
}

 
 Future<bool> _confirmEmail()async {
  await Future.delayed(Duration(milliseconds: 3000),(){
   _navigationConfirm();

  });
    
  return prefs.status;
}
void _navigationConfirm(){
   Navigator.pushNamedAndRemoveUntil(context, 'confirm', (route) => false);
   //final route = MaterialPageRoute(builder: (context) => ConfirmPage());
  // Navigator.push(context, route);
    //Navigator.of(this.context).pushReplacementNamed('confirm');
} 

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
      title: const Text('home'),
      backgroundColor: FitAppTheme.bgColor2,
    ),
    drawer: const NavigationDrawer(),
  );
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          
          buildHeader(context),
          buildMenuItems(context),

        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(
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
    padding: EdgeInsets.only(
    top: 24 + MediaQuery.of(context).padding.top,
    bottom: 24,
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 52,
          backgroundColor: FitAppTheme.black,
          backgroundImage: ExactAssetImage('assets/ic_logocolor.png'),
        ),
        SizedBox(height: 12.0),
        
        Text("${prefs.nombre}", style: FitAppTheme.subtitle),
       
       // Text('${prefs.email}', style: FitAppTheme.subtitle),
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    color: FitAppTheme.white,
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16.0,
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio', style: FitAppTheme.subtitleBlack),
          onTap: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>  HomePage(),
            )),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Perfil', style: FitAppTheme.subtitleBlack),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('Bucar Centro', style: FitAppTheme.subtitleBlack),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Cerrar Sesion', style: FitAppTheme.subtitleBlack),
          onTap: () {
            
          },
        ),
        
        const Divider(color: FitAppTheme.spacer),
        //Spacer(),
        ListTile(
          leading: const Icon(Icons.close),
          title: const Text('Salir', style: FitAppTheme.subtitleBlack),
          onTap: () {
           // Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Spacer(),
        Container(
          width: double.infinity,
          height: 120,
          color: FitAppTheme.white,
        )

      ],
    ),
  );
}