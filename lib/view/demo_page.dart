import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DemoPage extends StatelessWidget {
  final data;
  const DemoPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var date = DateFormat('dd-MM-yyyy')
        .format(DateTime.parse(data["FechaCreacion"]) ?? now);
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "${data["FullName"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          var snackBar =
                              SnackBar(content: Text('Estamos trabajando... '));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        heroTag: 'cambiar contraseña',
                        elevation: 0,
                        backgroundColor: Color(0xffF24F2C),
                        label: const Text("cambiar contraseña"),
                        icon: const Icon(Icons.lock),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      title: Text("${data["UserName"]}"),
                      leading: Icon(Icons.admin_panel_settings),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("${data["Email"]}"),
                      leading: Icon(Icons.email),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("${data["PhoneNumber"]}"),
                      leading: Icon(Icons.phone),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("${date}"),
                      leading: Icon(Icons.date_range),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xffF24F2C), Color(0xffF24F2C)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/ic_logocolor.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
