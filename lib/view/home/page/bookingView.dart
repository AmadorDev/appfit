import 'package:appsfit/shared/providers/bottom_nav_bar_provider.dart';
import 'package:appsfit/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/view/bookings/bookings.dart';

// class BookingPage extends StatefulWidget {
//   BookingPage({Key? key}) : super(key: key);

//   @override
//   State<BookingPage> createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   @override
//   Widget build(BuildContext context) {
//     final prov = Provider.of<FitsProvider>(context, listen: false);

//     _fetchData() async {
//       await Future.delayed(Duration.zero);
//       prov.detailReset();
//       return 'REMOTE DATA';
//     }

//     _fetchData();
//     return Center(
//         child: Container(
//       child: Text('Reserva'),
//     ));
//   }
// }

class BookingView extends StatelessWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fitspro = Provider.of<FitsProvider>(context, listen: false);
    final bpro = Provider.of<BookinProvider>(context);
    final bnbpro = Provider.of<BNBProvider>(context);

    if (bpro.activeMembership) {
      //reset detail page
      fitspro.detailResets();
      return BookingPage();
    } else {
      return backDelayed();
    }
  }
}

class backDelayed extends StatelessWidget {
  const backDelayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bnpro = Provider.of<BNBProvider>(context);
    Future.delayed(Duration.zero, () {
      var snackBar = SnackBar(content: Text('Debe tener una membresia activa'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      bnpro.currentIndex = 0;
    });
    return Container();
  }
}
