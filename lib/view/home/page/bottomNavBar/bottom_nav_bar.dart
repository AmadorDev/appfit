import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/providers/bottom_nav_bar_provider.dart';
import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/details/detailsFitsView.dart';
import 'package:appsfit/view/home/page/advanceView.dart';
import 'package:appsfit/view/home/page/bookingView.dart';
import 'package:appsfit/view/home/page/bottomNavBar/bottom_body.dart';
import 'package:appsfit/view/home/page/bottomNavBar/botton_bar.dart';
import 'package:appsfit/view/home/page/profileView.dart';
import 'package:appsfit/view/home/page/storeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottonNavigationBar extends StatelessWidget {
  const BottonNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BNBProvider(),
      child: _ContainerParent(),
    );
  }
}

class _ContainerParent extends StatelessWidget {
  const _ContainerParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bnbpro = Provider.of<BNBProvider>(context);
    final currentIndex = bnbpro.currentIndex;

    return Scaffold(
      body: bottomBody(currentIndex: currentIndex),
      bottomNavigationBar: bottonBar(currentIndex: currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: FitAppTheme.white,
    );
  }
}
