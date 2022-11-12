import 'package:appsfit/globals/constants.dart';
import 'package:appsfit/shared/models/bookings/Room.dart';
import 'package:appsfit/shared/models/bookings/RoomResponse.dart';
import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/bookings/widgets/button_room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContainerRoom extends StatelessWidget {
  ContainerRoom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<RoomResponse> getData() async {
      final bpro = Provider.of<BookinProvider>(context, listen: false);
      final data =
          await bpro.getRoom(bpro.codigoUnidadNegocio, bpro.codigoSede);
      return data;
    }

    return FutureBuilder(
      future: getData(),
      builder: (
        BuildContext context,
        AsyncSnapshot<RoomResponse> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: FitAppTheme.bgColor2,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text(Constants.futureError);
          } else if (snapshot.hasData) {
            if (snapshot.data!.date!.length > 0) {
              return _contentBody(list: snapshot.data!.date!);
            } else {
              return const Text(Constants.roomEmpty);
            }
          } else {
            return const Text(Constants.roomEmpty);
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}

class _contentBody extends StatelessWidget {
  List<Room> list;
  _contentBody({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1),
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Icon(
                  Icons.sunny,
                  color: FitAppTheme.txt_subtitle,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Seleccione Sala:',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ]),
              ButtonHorizontalRoom(
                list: list,
              ),
            ],
          ),
        )
      ],
    );
  }
}
