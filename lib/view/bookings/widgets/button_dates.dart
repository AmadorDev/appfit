import 'package:appsfit/shared/models/bookings/DateModel.dart';
import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonHorizontalDates extends StatelessWidget {
  List<DateModel>? list;
  ButtonHorizontalDates({
    Key? key,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bprov = Provider.of<BookinProvider>(context);
    if (list == null) Container();
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list?.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              child: OutlinedButton(
                onPressed: () async {
                  bprov.diaNumero = "${list![index].diaSemana}";
                  bprov.fechaHoraReserva =
                      "${list![index].fechaTextoParametro}";
                  bprov.flag = list![index].flagCantidadReserva;

                  bprov.selectDate = index;
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 1.0,
                      color: index == bprov.selectDate
                          ? FitAppTheme.color_selected
                          : Colors.grey),
                ),
                child: Text(
                  "${list![index].diaSemanaTexto} - ${list![index].fechaTextoTitulo} ",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
            );
          }),
    );
  }
}
