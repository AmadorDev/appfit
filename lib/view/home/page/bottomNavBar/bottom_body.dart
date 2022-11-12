import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/providers/bottom_nav_bar_provider.dart';
import 'package:appsfit/shared/providers/evolution_provider.dart';
import 'package:appsfit/view/bookings/bookings.dart';
import 'package:appsfit/view/details/detailsFitsView.dart';
import 'package:appsfit/view/home/page/advanceView.dart';
import 'package:appsfit/view/home/page/profileView.dart';
import 'package:appsfit/view/home/page/storeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bottomBody extends StatelessWidget {
  int currentIndex;
  bottomBody({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return DetailsFitsPage();
      case 1:
        return BookingView();
      case 2:
        return StorePage();
      case 3:
        return AdvancePage();

      default:
        return DetailsFitsPage();
    }
  }
}
