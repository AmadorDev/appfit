import 'dart:convert';
import 'dart:ui';

import 'package:appsfit/shared/api/apiServices.dart';
import 'package:appsfit/shared/models/details/detailsModel.dart';
import 'package:appsfit/shared/models/favorite/favoriteModel.dart';
import 'package:appsfit/shared/models/favorite/favoriteResponse.dart';
import 'package:appsfit/shared/models/general.dart';
import 'package:appsfit/shared/providers/favoriteProvider.dart';
import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/shared/utils/widgets/cardWidget.dart';
import 'package:appsfit/view/home/homeView.dart';
import 'package:appsfit/view/home/page/profileView.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsFitsPage extends StatefulWidget {
  DetailsFitsPage({Key? key}) : super(key: key);

  @override
  State<DetailsFitsPage> createState() => _DetailsFitsPageState();
}

class _DetailsFitsPageState extends State<DetailsFitsPage> {
  List<Details> onDetailsFits = [];
  List<Favorite> onFavoriteFitss = []; //
  Details? details;
  bool _visibleTextDetails = true;
  int index = 0;
  int _selectedIndex = 0;
  int currentIndex = 0;
  int indexFav = 1;
  int indexFavSelect = 1;
  /*updates(Details value) {
      print(value.nombrePaquete);
             details = value;

      setState(() {
      });
  }*/

  _getDetails(Details value, indexs) async {
    print(value.nombrePaquete);
    details = value;
    index = indexs;

    setState(() {});

    // final jsonString = json.encode(value);
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String? fits = ModalRoute.of(context)!.settings.arguments as String?;

    final apiProvider = Provider.of<FitsProvider>(context, listen: false);
    final favProvider = Provider.of<FavoriteProvider>(context, listen: false);

    final AsyncMemoizer _memoizer = AsyncMemoizer();
    final prefs = new PreferencesUser();
    final general = General.fromJson(fits!);

    apiProvider.keyUse('${prefs.defaulkey}', '${general.defaultKeyEmpresa!}');

    onFavoriteFitss = favProvider.onFavoriteFits;

    List result = onFavoriteFitss
        .where((o) => o.defaultKeyEmpresa == '${general.defaultKeyEmpresa!}')
        .toList();

    print(result.length);

    _fetchData(data, selected) {
      return _memoizer.runOnce(() async {
        await Future.delayed(Duration(seconds: 1));

        apiProvider.detailsFit(data);

        return 'REMOTE DATA';
      });
    }

    return Scaffold(
      backgroundColor: FitAppTheme.white,
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
              icon: result.length == indexFavSelect
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_outline),
              onPressed: () async {
                if (result.length == 0) {
                  setState(() {
                    indexFavSelect = 1;
                  });

                  ApiServices.addFavorite('${prefs.defaulkey}',
                      '${general.defaultKeyEmpresa!}', context, 1);
                } else if (result.length == 1) {
                  setState(() {
                    indexFavSelect = 0;
                  });

                  await favProvider
                      .removeFavoriteById('${general.defaultKeyEmpresa!}');
                  ApiServices.addFavorite('${prefs.defaulkey}',
                      '${general.defaultKeyEmpresa!}', context, 0);
                }
                //
                // print('${prefs.defaulkey} -' general.defaultKeyEmpresa);
              }),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 6.0),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: FitAppTheme.white100, blurRadius: 0),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  child: Image.network(
                    '${general.logoTipo}',
                    height: 40.0,
                    width: 40.0,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        child: IconButton(
                          padding: new EdgeInsets.only(top: 5, left: 2),
                          color: FitAppTheme.grey,
                          icon: new Icon(
                            Icons.image,
                          ),
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
        backgroundColor: FitAppTheme.bgColor2,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Column(
                  children: [
                    /*Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                         boxShadow: <BoxShadow>[
                           BoxShadow(color: FitAppTheme.white100, offset: const Offset(1.0, 2.0), blurRadius: 0),
                            ],
                           ),
                            child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                            child: Image.network(
                              general.logoTipo!,
                              height: 150.0,
                              width: 150.0,
                              errorBuilder: (context, error, stackTrace) {
                          return Container(
                            child: IconButton(
                              padding: EdgeInsets.only(top: 5, left: 2),
                              color: FitAppTheme.grey,
                              icon: new Icon(Icons.image, ),
                              onPressed: (){
                                
                              },
                          ),
                        );
                          },
                          ),
                           ),
                        ),*/
                    // Text(general.nombreComercialEmpresa!, style: FitAppTheme.title12,),

                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              NewsDetails(),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: FutureBuilder(
                  future: ApiServices.listDetails('${prefs.defaulkey}',
                      '${general.defaultKeyEmpresa!}'), //TODO: REEMPLAZAR por prefs.defaulkey y fits
                  builder: (_, AsyncSnapshot<List<Details>> v) {
                    if (v.hasData) {
                      switch (v.connectionState) {
                        case ConnectionState.done:
                          if (v.data!.length >= 1) {
                            _fetchData(v.data![0], _selectedIndex);
                          } else {
                            _fetchData(null, null);
                          }

                          break;
                        default:
                          return Text("");
                      }

                      if (v.data!.length == 0) {
                        return Center(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.fitness_center,
                                  size: 40.0,
                                  color: FitAppTheme.grey,
                                ),
                                Text(
                                  '',
                                  style: FitAppTheme.title16,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'No se encontró información',
                                  style: FitAppTheme.description,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (v.data!.length >= 1) {
                        return ListView.builder(
                          itemCount: v.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      apiProvider.detailsFit(v.data![index]);

                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                      print('INDEX $_selectedIndex');
                                    },
                                    child: Card(
                                        shadowColor: FitAppTheme.bgColor2,
                                        color: index == _selectedIndex
                                            ? FitAppTheme.bgColorSecondary
                                            : FitAppTheme.white,
                                        elevation: 3,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18,
                                                            bottom: 10,
                                                            right: 16,
                                                            top: 13),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                              '${v.data![index].desFechaInicio}',
                                                              style: FitAppTheme
                                                                  .text12),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                              '${v.data![index].desFechaFin}',
                                                              style: FitAppTheme
                                                                  .text12),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                              '(${v.data![index].codigoMembresia}) ${v.data![index].nombrePaquete}',
                                                              style: FitAppTheme
                                                                  .text12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: FitAppTheme.bgColorSecondary,
                        color: FitAppTheme.bgColor,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  viewDet(FitsProvider apiProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text('PLAN: ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].nombrePaquete : '' }', style: FitAppTheme.title15,),
        Text(
          'SOCIO: ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].nombres : ''} ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].apellidos : ''}',
          style: FitAppTheme.title15,
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          'OBS: ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].observacion : ''}',
          style: FitAppTheme.title15,
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          'PLAN: ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].nombrePaquete : ''}',
          style: FitAppTheme.title15,
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          'INSCRIPCION: ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].descFechaCreacion : ''}',
          style: FitAppTheme.title15,
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          'PRECIO: ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].costo : ''}',
          style: FitAppTheme.title15,
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          'A CUENTA: ${apiProvider.onDetailsFits.isNotEmpty ? apiProvider.onDetailsFits[index].debe : ''}',
          style: FitAppTheme.title15,
        ),
      ],
    );
  }
}

class NewsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FitsProvider>(context);
    final String sg = "";

    String convert(String s) {
      String dateWithTS;
      dateWithTS = s.substring(0, 10) + '' + s.substring(10);
      DateTime dateTime = DateTime.parse(dateWithTS);
      final _dateFormat = new DateFormat('dd/MM/yyyy');
      s = _dateFormat.format(dateTime);

      return s;
    }

    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (prov.detail != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                photoState('${prov.detail!.imageUrl}',
                    '${prov.detail!.nombreEstado}', prov.detail!.colorsState),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'SOCIO: (${prov.detail != null ? prov.detail!.codigoSocio : ''}) ${prov.detail != null ? prov.detail!.nombres : ''} ${prov.detail != null ? prov.detail!.apellidos : ''}',
                  style: FitAppTheme.title15,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'OBS: ${prov.detail != null ? prov.detail!.obtenerTiempoVencimiento : ''}',
                  style: FitAppTheme.title15,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'PLAN: ${prov.detail != null ? prov.detail!.descripcion : ''}',
                  style: FitAppTheme.title15,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'INSCRIPCION: ${prov.detail != null ? convert('${prov.detail!.fechaCreacion}') : ''}',
                  style: FitAppTheme.title15,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'PRECIO: ${prov.detail != null ? prov.detail!.costo : ''}',
                  style: FitAppTheme.title15,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  'A CUENTA: ${prov.detail != null ? prov.detail!.montoTotal : ''}',
                  style: FitAppTheme.title15,
                ),
                SizedBox(
                  height: 3.0,
                ),
                cartView(),
              ],
            )
        ],
      ),
    );
  }

  Widget textState(String text) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                color: FitAppTheme.bgColorSecondary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 18, bottom: 12, right: 16, top: 12),
                    child: Text(text,
                        textAlign: TextAlign.start, style: FitAppTheme.title16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget photoState(String src, String state, int colors) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(color: FitAppTheme.white100, blurRadius: 0),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60.0)),
            child: Image.network(
              src,
              height: 120.0,
              width: 120.0,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  child: IconButton(
                    padding: EdgeInsets.only(top: 5, left: 2),
                    color: FitAppTheme.grey,
                    icon: new Icon(
                      Icons.image,
                    ),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(colors),
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 0),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60.0)),
            child: Center(
                child: Text(
              state,
              style: FitAppTheme.title15,
            )),
          ),
        ),
      ],
    );
  }
}
