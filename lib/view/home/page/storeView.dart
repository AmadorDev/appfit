import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
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
      child: Text('Estamos trabajando...'),
    ));
  }
}
