import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/details/detailsFitsView.dart';
import 'package:appsfit/view/home/page/advanceView.dart';
import 'package:appsfit/view/home/page/bookingView.dart';
import 'package:appsfit/view/home/page/profileView.dart';
import 'package:appsfit/view/home/page/storeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottonNavigationPage extends StatefulWidget {
  BottonNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottonNavigationPage> createState() => _BottonNavigationPageState();
}

class _BottonNavigationPageState extends State<BottonNavigationPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex, context),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: FitAppTheme.white,
    );
  }

  Widget _callPage(int paginaActual, BuildContext context) {
    switch (paginaActual) {
      case 0:
        return DetailsFitsPage();
      case 1:
        return BookingPage();
      case 2:
        return StorePage();
      case 3:
        return AdvancePage();
      case 4:
        return ProfilePage();
      default:
        return DetailsFitsPage();
    }
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: FitAppTheme.bgColor2,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: FitAppTheme.bgColor2,
          icon: Icon(
            Icons.circle_outlined,
          ),
          label: 'Estado',
          activeIcon: Icon(Icons.circle),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.date_range_outlined,
          ),
          label: 'Reservas',
          activeIcon: Icon(Icons.date_range),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_outlined,
          ),
          label: 'Tienda',
          activeIcon: Icon(Icons.shopping_bag),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.rate_review_outlined,
          ),
          label: 'Avance',
          activeIcon: Icon(Icons.rate_review),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outlined,
          ),
          label: 'Perfil',
          activeIcon: Icon(Icons.person),
        ),
      ],
      selectedLabelStyle: FitAppTheme.text12,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black54,
    );
  }
}
