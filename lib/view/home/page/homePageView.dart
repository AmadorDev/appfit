import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:appsfit/shared/api/apiServices.dart';
import 'package:appsfit/shared/models/favorite/favoriteModel.dart';
import 'package:appsfit/shared/models/search/searchModel.dart';
import 'package:appsfit/shared/providers/favoriteProvider.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/shared/utils/widgets/searchWidget.dart';
import 'package:appsfit/view/home/custom/homeDrawer.dart';
import 'package:appsfit/view/home/homeView.dart';
import 'package:appsfit/view/home/page/profileView.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<Fits> fits = [];
  List<Favorite> favorites = [];
  String query = '';
  bool loading = false;
  Timer? debouncer;

  final prefs = new PreferencesUser();

  @override
  void initState() {
    super.initState();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    // loading = true;
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context, listen: false);
    // favProvider.getFavorites(prefs.defaulkey);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: FitAppTheme.bgColor2,
      ),
      backgroundColor: FitAppTheme.white,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Text(fits.length.toString()),
            buildSearch(),
            const Divider(color: FitAppTheme.spacer),

            Expanded(
              child: ListView.builder(
                itemCount: fits.length,
                itemBuilder: (context, index) {
                  final fitss = fits[index];
                  String? arg = fits[index].defaultKeyEmpresa;
                  String? arg2 = fits[index].logoTipo;
                  String? e = fits[index].nombreComercialEmpresa;
                  int? activo = 0;

                  final params = {
                    "NombreComercialEmpresa": e,
                    "LogoTipo": arg2,
                    "DefaultKeyEmpresa": arg,
                    "activo": activo
                  };

                  final jsonString = json.encode(params);

                  return buildFits(fitss, jsonString);
                },
              ),
            ),

            SizedBox(height: 5.0),

            titleFavorite("FAVORITOS"),

            listFavoriteItems(),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
      text: query,
      hintText: 'Buscar Centro',
      onChanged: searchFits,
      visible: loading);

  Future searchFits(String query) async => debounce(() async {
        final fit = await ApiServices.seachFits(prefs.defaulkey, query);

        if (!mounted) return;

        if (query == '') {
          // loading = false;
        }

        // if (fits.length == 0) {
        //   loading = true;
        // }

        setState(() {
          this.query = query;
          this.fits = fit;
          this.loading = loading;
        });
      });

  // lowercase(String s) => s.toLowerCase();
  // capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Widget buildFits(Fits fitss, String arg) => ListTile(
        selected: true,
        onTap: () {
          Navigator.pushReplacementNamed(context, 'BottonPage', arguments: arg);
          // Navigator.pushNamed(context, 'BottonPage', arguments: arg);
        },
        leading: logoFits(fitss.logoTipo!),
        title: Text(
          fitss.nombreComercialEmpresa!,
          style: FitAppTheme.text12,
        ),
      );

  Widget titleFavorite(String text) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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

  Widget nameFits(String title) {
    return Container(
      height: 50.0,
      margin: new EdgeInsets.only(left: 26.0),
      decoration: new BoxDecoration(
        color: FitAppTheme.grey,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(title),
          ),
        ],
      ),
    );
  }

  Widget logoFits(String src) {
    return Container(
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
          src,
          height: 40.0,
          width: 40.0,
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
    );
  }
}

Widget fitCardLogo(String img) {
  return Container(
    margin: const EdgeInsets.only(bottom: 0.0),
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
        img,
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
  );
}

class cards extends StatelessWidget {
  final Favorite favorite;
  final String arg;

  const cards({Key? key, required this.favorite, required this.arg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: Stack(
        children: <Widget>[
          Card(
            child: ListTile(
                leading: fitCardLogo('${favorite.logoTipo}'),
                title: Text(
                  '${favorite.nombreComercialEmpresa}',
                  style: FitAppTheme.text12,
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Navigator.pushNamed(context, 'detailFits', arguments: arg);
                  Navigator.pushReplacementNamed(context, 'BottonPage',
                      arguments: arg);
                }),
          ),
        ],
      ),
    );
  }
}

class listFavoriteItems extends StatelessWidget {
  const listFavoriteItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context, listen: false);
    print("widget list favorites");
    return Expanded(
      child: FutureBuilder(
        future: favProvider.getFavoritesFuture('${prefs.defaulkey}'),
        builder: (_, AsyncSnapshot<List<Favorite>> v) {
          if (v.hasData) {
            if (v.data!.length == 0) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: FitAppTheme.grey,
                    ),
                    Text(
                      'Lista de favoritos',
                      style: FitAppTheme.title16,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Los favoritos que agregues aparecerá aquí',
                      style: FitAppTheme.description,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: v.data!.length,
              itemBuilder: (context, index) {
                final fit = v.data![index];

                String? arg = v.data![index].defaultKeyEmpresa;
                String? arg2 = v.data![index].logoTipo;
                String? e = v.data![index].nombreComercialEmpresa;
                int? activo = 1;

                final params = {
                  "NombreComercialEmpresa": e,
                  "LogoTipo": arg2,
                  "DefaultKeyEmpresa": arg,
                  "activo": activo
                };

                final jsonString = json.encode(params);

                return cards(favorite: fit, arg: jsonString);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: FitAppTheme.bgColorSecondary,
              color: FitAppTheme.bgColor,
            ),
          );
        },
      ),
    );
  }
}
