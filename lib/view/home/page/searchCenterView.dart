import 'package:flutter/material.dart';

class SearchCenterPage extends StatefulWidget {
  SearchCenterPage({Key? key}) : super(key: key);

  @override
  State<SearchCenterPage> createState() => _SearchCenterPageState();
}

class _SearchCenterPageState extends State<SearchCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Container( child: Text('SEARCH'),);
  }
}