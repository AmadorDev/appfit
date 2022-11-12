import 'dart:convert' show utf8;

import 'package:appsfit/globals/constants.dart';
import 'package:appsfit/shared/models/bookings/DateModel.dart';
import 'package:appsfit/shared/models/bookings/Room.dart';
import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/shared/providers/providers.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/bookings/widgets/container_dates.dart';
import 'package:appsfit/view/bookings/widgets/container_room.dart';
import 'package:appsfit/view/bookings/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClaseTab extends StatelessWidget {
  const ClaseTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: size.height,
        child: Column(
          children: [
            ContainerRoom(),
            Divider(
              thickness: 3,
              height: 30,
            ),
            ContainerDates(),
            Divider(
              thickness: 3,
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                children: [
                  Icon(
                    Icons.sunny,
                    color: FitAppTheme.txt_subtitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Selecione Clases: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: FitAppTheme.txt_subtitle,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            ListClases(),
          ],
        ),
      ),
    );
  }
}

class ListClases extends StatelessWidget {
  const ListClases({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bprov = Provider.of<BookinProvider>(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 140),
        child: FutureBuilder<List?>(
          future: bprov.getHorarios(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List?> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: FitAppTheme.bgColor,
              ));
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text(Constants.futureError);
              } else if (snapshot.hasData) {
                //list
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => CardActivity(
                          data: snapshot.data![index],
                        ),
                    itemCount: snapshot.data!.length);
              } else {
                return const Text(Constants.clasesEmpty);
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    );
  }
}
