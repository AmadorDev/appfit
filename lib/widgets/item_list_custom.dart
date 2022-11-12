import 'package:appsfit/shared/utils/theme/appThemeView.dart';
import 'package:appsfit/utils/utils.dart';
import 'package:flutter/material.dart';

class ItemListCustom extends StatelessWidget {
  String name_one;
  String name_thow;
  String textColor;
  Color colorSelected;
  ItemListCustom(
      {Key? key,
      required this.name_one,
      required this.name_thow,
      required this.textColor,
      required this.colorSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(colorSelected);
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(vertical: 1.5, horizontal: 0),
      child: Stack(
        children: [
          Card(
            // shadowColor: colorSelected,
            // color: Colors.white,

            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: colorSelected,
              ),
            ),
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          name_one,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: HexColor(textColor),
                            fontSize: 12,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          name_thow,
                          style: TextStyle(
                            color: HexColor(textColor),
                            fontSize: 12,
                          ),
                        ),
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
}
