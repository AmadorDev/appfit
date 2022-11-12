import 'package:appsfit/globals/constants.dart';
import 'package:appsfit/shared/api/apiEvolution.dart';
import 'package:appsfit/shared/providers/bottom_nav_bar_provider.dart';
import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/shared/providers/providers.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/utils/utils.dart';
import 'package:appsfit/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvancePage extends StatelessWidget {
  const AdvancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Map> getData() async {
      final bookingPro = Provider.of<BookinProvider>(context, listen: false);
      final evoPro = Provider.of<EvolutionProvider>(context, listen: false);
      final respM = await evoPro.getMedidas(bookingPro.codigoUnidadNegocio,
          bookingPro.codigoSede, bookingPro.codigoSocio);
      return respM;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: FitAppTheme.bgColor2,
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back, color: Colors.black),
        //     onPressed: () => Navigator.popAndPushNamed(context, 'home')),
        title: Center(
          child: Text(
            'Evolución',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              if (snapshot.data!["Status"] == 0) {
                //success not data
                if (data!["Date"].length == 0) {
                  return Center(child: Text(Constants.medidas));
                }
                //success width data
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ItemHeader(
                        data: data["Date"],
                      ),
                      ContentDetail(),
                    ],
                  ),
                );
              } else {
                //validate params
                return _validateData(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data!["Message1"],
                      ),
                      Text(
                        data["Message2"],
                      ),
                    ],
                  ),
                );
              }
            } else {
              //progress
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
          }),
      backgroundColor: FitAppTheme.bgColor2,
    );
  }
}

class ContentDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final evoPro = Provider.of<EvolutionProvider>(context, listen: true);
    final data = evoPro.getItemEvolutions;
    print(data?.length);
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .70,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(50.0),
              topRight: const Radius.circular(50.0),
              bottomLeft: const Radius.circular(0),
              bottomRight: const Radius.circular(0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                // Text(
                //   "${evoPro.dateDetail}",
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => ListTile(
                      // leading: CircleAvatar(
                      //   child: Text("AHB"),
                      // ),
                      title: Text(
                        data[index]["nombre"],
                        style: TextStyle(color: Colors.grey[750], fontSize: 15),
                      ),
                      subtitle: Text(data[index]["valor"]),
                      // trailing: Text(data[index]["valor"]),
                    ),
                    itemCount: data?.length,
                    // separatorBuilder: (BuildContext context, int index) =>
                    //     Divider(
                    //   color: Colors.black45,
                    //   // height: 0.1,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _validateData extends StatelessWidget {
  Widget child;
  _validateData({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bnpro = Provider.of<BNBProvider>(context);
    Future.delayed(Duration.zero, () {
      // var snackBar = SnackBar(content: this.child);
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min, // needed for flexible height
            children: [
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  color: Colors.grey[800],
                  child: this.child),
            ],
          ),
        ),
      );
      bnpro.currentIndex = 0;
    });
    return Container();
  }
}

class ItemHeader extends StatefulWidget {
  List data;
  ItemHeader({Key? key, required this.data}) : super(key: key);

  @override
  State<ItemHeader> createState() => _ItemHeaderState();
}

class _ItemHeaderState extends State<ItemHeader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final evoPro = Provider.of<EvolutionProvider>(context);

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          itemCount: widget.data.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              evoPro.indexSelected = index;
              evoPro.setItemEvolutions = widget.data[index]["list"];
              evoPro.dateDetail = widget.data[index]["valor"];
            },
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: index == evoPro.indexSelected
                    ? Color(0xffF3CFBD)
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ListTile(
                title: Text(widget.data[index]["nombre"]),
                subtitle: Text(widget.data[index]["valor"]),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _titleDetail extends StatelessWidget {
  const _titleDetail({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${data["nombre"]}: ',
                style: TextStyle(
                  fontSize: 13,
                  color: HexColor(data["texto_color"]),
                  fontWeight: data["texto_negrita"]
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              Text(
                '${data["valor"]}',
                style: TextStyle(
                  fontSize: 13,
                  color: HexColor(data["texto_color"]),
                  fontWeight: data["texto_negrita"]
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
