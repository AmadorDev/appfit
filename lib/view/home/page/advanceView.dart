import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvancePage extends StatefulWidget {
  AdvancePage({Key? key}) : super(key: key);

  @override
  State<AdvancePage> createState() => _AdvancePageState();
}

class _AdvancePageState extends State<AdvancePage> {
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
      child: Text('Avance'),
    ));
  }
}
