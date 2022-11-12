import 'package:appsfit/globals/constants.dart';
import 'package:appsfit/shared/api/apiBooking.dart';
import 'package:appsfit/shared/providers/booking_provider.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/bookings/widgets/card_clases.dart';
import 'package:appsfit/view/bookings/widgets/card_reservations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingTab extends StatelessWidget {
  const BookingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bprov = Provider.of<BookinProvider>(context);

    bprov.resetDate();
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              // color: Colors.blue,
              child: FutureBuilder<Map<String, dynamic>>(
                future: apiBooking.apiListReservations(
                  int.parse('${bprov.codigoUnidadNegocio}'),
                  int.parse('${bprov.codigoSede}'),
                  int.parse(bprov.codigoMembresia),
                  int.parse('${bprov.codigoSocio}'),
                ),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot,
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
                      final date = snapshot.data!["Date"];

                      if (date.length > 0) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (_, index) => CardReservations(
                                  data: date[index],
                                ),
                            itemCount: date!.length);
                      }
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: Center(
                            child: const Text('No hay reservas que mostar')),
                      );
                      //list

                    } else {
                      return const Text(Constants.clasesEmpty);
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
