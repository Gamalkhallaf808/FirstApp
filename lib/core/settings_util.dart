import 'package:flutter/material.dart';
import 'package:flutter_app_2/app_settings.dart';
import 'package:flutter_app_2/pages/sign.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsUtil {
  static Future<void> signOutFlow(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you wanna sign out?'),
                Text('You well need to login again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove(AppSettings.userPhone);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignPage()),
                );
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<String> getCachedUserPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppSettings.userPhone) ?? "--";
  }
}
