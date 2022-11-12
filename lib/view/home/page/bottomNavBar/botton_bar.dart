import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/providers/bottom_nav_bar_provider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bottonBar extends StatelessWidget {
  int currentIndex;
  bottonBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bnbpro = Provider.of<BNBProvider>(context);

    return BottomNavigationBar(
      backgroundColor: FitAppTheme.bgColor2,
      currentIndex: bnbpro.currentIndex,
      showUnselectedLabels: true,
      onTap: (index) {
        bnbpro.currentIndex = index;
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
            Icons.accessibility,
          ),
          label: 'Evolución',
          activeIcon: Icon(Icons.accessibility),
        ),
      ],
      selectedLabelStyle: FitAppTheme.text12,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black54,
    );
  }
}
