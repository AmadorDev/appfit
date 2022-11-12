import 'package:appsfit/globals/constants.dart';
import 'package:appsfit/shared/api/apiBooking.dart';
import 'package:appsfit/shared/providers/fitsProvider.dart';
import 'package:appsfit/shared/storage/preferenceUser.dart';
import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/view/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FitsProvider>(context, listen: false);

    _fetchData() async {
      await Future.delayed(Duration.zero);
      prov.detailReset();
      return 'REMOTE DATA';
    }

    _fetchData();
    return FutureBuilder(
      future: apiBooking.apiProfile(PreferencesUser().defaulkey),
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, dynamic>> snapshot,
      ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: FitAppTheme.bgColor2,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text(Constants.futureError);
          } else if (snapshot.hasData) {
            var data = snapshot.data!["Date"];
            if (data != null) {
              return DemoPage(data: data);
            } else {
              return const Text(Constants.futureError);
            }
          } else {
            return const Text(Constants.dateEmpty);
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
