import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/bookings/bookings.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const ClaseTab(),
      const BookingTab(),
    ];
    final _kTabs = <Tab>[
      const Tab(text: 'CLASES'),
      const Tab(text: 'RESERVAS'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FitAppTheme.bgColor2,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicatorColor: Colors.white,
                padding: EdgeInsets.all(0),
                tabs: _kTabs,
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.grey[100],
          child: TabBarView(
            children: _kTabPages,
          ),
        ),
      ),
    );
  }
}
