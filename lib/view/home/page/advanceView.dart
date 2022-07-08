
import 'package:flutter/material.dart';

class AdvancePage extends StatefulWidget {
  AdvancePage({Key? key}) : super(key: key);

  @override
  State<AdvancePage> createState() => _AdvancePageState();
}

class _AdvancePageState extends State<AdvancePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container( child: Text('Avance'),));
  }
}