import 'dart:io';

import 'package:appsfit/shared/providers/favoriteProvider.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/home/custom/DrawerController.dart';
import 'package:appsfit/view/home/custom/homeDrawer.dart';
import 'package:appsfit/view/home/page/homePageView.dart';
import 'package:appsfit/view/home/page/profileView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;
  @override
  void initState() {
    drawerIndex = DrawerIndex.Search;
    screenView = const HomePages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitAppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: FitAppTheme.white,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;

      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const HomePages();
          });
          break;
        case DrawerIndex.Profile:
          setState(() {
            screenView = ProfilePage();
          });
          break;
        case DrawerIndex.Search:
          setState(() {
            screenView = HomePages();
          });
          break;
        case DrawerIndex.Close:
          setState(() {
            Navigator.of(context).pop();
            SystemNavigator.pop();
            //exit(0);
            print('salir');
          });
          break;
        default:
          break;
      }
    }
  }
}
