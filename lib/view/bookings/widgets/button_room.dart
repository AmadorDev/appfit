import 'package:appsfit/shared/models/bookings/Room.dart';
import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonHorizontalRoom extends StatelessWidget {
  List<Room> list;
  ButtonHorizontalRoom({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bprov = Provider.of<BookinProvider>(context);

    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              child: OutlinedButton(
                onPressed: () {
                  bprov.tipoSala = "${list[index].tipoSala}";
                  bprov.codigoSala = "${list[index].codigoSala}";
                  bprov.selectRoom = index;
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 1.0,
                      color: index == bprov.selectRoom
                          ? FitAppTheme.color_selected
                          : Colors.grey),
                ),
                child: Text(
                  " ${list[index].descripcion?.toLowerCase()}",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
            );
          }),
    );
  }
}
