import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:flutter/material.dart';

Widget cartView(){
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
              color: FitAppTheme.grey200,
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
                 left: 18, bottom: 10, right: 16, top: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(child: Text('TIEMPO'),),
                    Container(child: Text('FECHA INICIO'),),
                    Container(child: Text('FECHA FIN'),),
                  ],
                ),
               ),
             ],
            ),
           ),
         ),
        ],
      ),
    );
   }