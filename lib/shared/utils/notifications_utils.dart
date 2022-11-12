import 'package:flutter/material.dart';

class NotificationUtil {
  static GlobalKey<ScaffoldMessengerState> messageKey = new GlobalKey();

  static showSnackbar(String message) {
    final snackBar = new SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
    messageKey.currentState?.showSnackBar(snackBar);
  }
}
