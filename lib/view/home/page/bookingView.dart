import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FitsProvider>(context, listen: false);

    _fetchData() async {
      await Future.delayed(Duration.zero);
      prov.detailReset();
      return 'REMOTE DATA';
    }

    _fetchData();
    return Center(
        child: Container(
      child: Text('Reserva'),
    ));
  }
}
