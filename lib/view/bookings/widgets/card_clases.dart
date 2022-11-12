import 'dart:async';

import 'package:appsfit/shared/api/apiBooking.dart';
import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/utils/utils.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CardActivity extends StatelessWidget {
  Map data;
  CardActivity({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyleSubTitle =
        TextStyle(color: FitAppTheme.txt_subtitle, fontSize: 13);
    var textStyleTitle = TextStyle(color: FitAppTheme.txt_title, fontSize: 13);
    var exad = data["ColorReserva"] != null
        ? data["ColorReserva"].split("#")
        : "#eeeeee";
    var bg_btn = "0xff${exad[1]}";

    final RoundedLoadingButtonController _btnController1 =
        RoundedLoadingButtonController();

    void _doSomething(
        RoundedLoadingButtonController controller, dynamic s) async {
      print(s);
      Timer(Duration(seconds: 3), () {
        controller.success();
      });
    }

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 7,
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "${data["HoraInicioTexto"]}",
                  style: textStyleSubTitle,
                ),
                Text(
                  "${data["HoraFinTexto"]}",
                  style: textStyleSubTitle,
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${data["Disciplina"]}",
                        style: textStyleTitle,
                      ),
                    ),
                    Text(
                      "${data["NombreProfesionalFitness"]}",
                      style: textStyleSubTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttonCustom(
                  color: bg_btn,
                  data: data,
                ),
                Text(
                  "${data["CantidadAsistencias"]}/${data["CapacidadPermitida"]}",
                  style: textStyleSubTitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class buttonCustom extends StatefulWidget {
  String color;
  Map data;
  buttonCustom({Key? key, required this.color, required this.data})
      : super(key: key);

  @override
  State<buttonCustom> createState() => _buttonCustomState();
}

class _buttonCustomState extends State<buttonCustom> {
  var _isLoading = false;
  Map data = new Map();
  var name = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.data;
  }

  void _onSubmit() async {
    setState(() => _isLoading = true);
    final bprov = Provider.of<BookinProvider>(context, listen: false);
    if (bprov.flag > 0) {
      NotificationUtil.showSnackbar('Ya tienes una reserva');
    } else {
      switch (data["EventoBoton"]) {
        case 1:
          final resp = await bprov.reserva(
              '',
              data["Disciplina"],
              data["HoraInicioTexto"],
              data["HoraFinTexto"],
              data["CodigoHorarioClasesConfiguracion"],
              data["CodigoPaquete"],
              data["CodigoHorarioClasesTiempoReal"]);
          ;
          setState(() => _isLoading = false);
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return customDialogBox(
                  title: resp["Message1"],
                  msg_one: resp["Message2"],
                  msg_two: resp["Message3"],
                  logo: bprov.logoGym,
                  onPress: () {
                    Navigator.of(context).pop();
                    bprov.codigoUnidadNegocio = bprov.codigoUnidadNegocio;
                  },
                );
              });

          break;
        case 2:
          //cancel reserve
          final resp = await bprov.reserveCancel(
            data["CodigoSocio"],
            data["CodigoHorarioClasesConfiguracion"],
            data["CodigoHorarioClasesTiempoReal"],
            data["CodigoHorarioClasesConfiguracionAsistencias"],
          );
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return customDialogBox(
                  title: resp["Message1"],
                  msg_one: resp["Message2"],
                  msg_two: resp["Message3"],
                  logo: bprov.logoGym,
                  onPress: () {
                    Navigator.of(context).pop();
                    bprov.codigoUnidadNegocio = bprov.codigoUnidadNegocio;
                  },
                );
              });

          break;
        case 3:
          //MensajeBoton
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return customDialogBox(
                  title: "IMFORMACION",
                  msg_one: data["MensajeBoton"],
                  msg_two: '',
                  logo: bprov.logoGym,
                  onPress: () {
                    Navigator.of(context).pop();
                    bprov.codigoUnidadNegocio = bprov.codigoUnidadNegocio;
                  },
                );
              });
          break;
        case 4:
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return customDialogBox(
                  title: "IMFORMACION",
                  msg_one: data["MensajeBoton"],
                  msg_two: '',
                  logo: bprov.logoGym,
                  onPress: () {
                    Navigator.of(context).pop();
                    bprov.codigoUnidadNegocio = bprov.codigoUnidadNegocio;
                  },
                );
              });
          break;

        default:
          return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(int.parse(widget.color)),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        child: _isLoading
            ? SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text("${widget.data["EstadoReserva"]}",
                style: TextStyle(fontSize: 12, color: Colors.white)),
        onPressed: _onSubmit,
      ),
    );
  }
}
