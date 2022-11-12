import 'package:appsfit/globals/constants.dart';
import 'package:flutter/material.dart';

class customDialogBox extends StatelessWidget {
  final String? title;
  final String? msg_one;
  final String? msg_two;
  final String logo;

  final Function() onPress;

  const customDialogBox(
      {Key? key,
      this.title,
      this.msg_one,
      this.msg_two,
      required this.logo,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, title, msg_one, msg_two, logo, onPress),
    );
  }
}

Widget contentBox(BuildContext context, String? title, String? msg_one,
    String? msg_two, String logo, onPress) {
  return Stack(
    children: [
      containerInferior(
          context, title, msg_one, msg_two, onPress), // parte inferior
      Positioned(
        left: Constants.padding,
        right: Constants.padding,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: Constants.avatarRadius,
          child: ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(Constants.avatarRadius)),
            child: Image.network(logo),
          ),
        ),
      ), // top part
    ],
  );
}

Widget containerInferior(BuildContext context, String? title, String? msg_one,
    String? msg_two, onPress) {
  return Container(
    padding: EdgeInsets.only(
        left: Constants.padding,
        top: Constants.avatarRadius + Constants.padding,
        right: Constants.padding,
        bottom: Constants.padding),
    margin: EdgeInsets.only(top: Constants.avatarRadius),
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.padding),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
        ]),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (title != '') ...[
          Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
        ],
        if (msg_one != '') ...[
          Text(
            msg_one ?? '',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 22,
          ),
        ],
        if (msg_two != '') ...[
          Text(
            msg_two ?? '',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 22,
          ),
        ],
        Align(
          alignment: Alignment.center,
          child: TextButton(
              onPressed: onPress,
              child: Text(
                "Aceptar",
                style: TextStyle(fontSize: 18),
              )),
        ),
      ],
    ),
  );
}
