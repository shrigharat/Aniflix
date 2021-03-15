import 'package:AniFlix/constants.dart';
import 'package:flutter/material.dart';

class UserSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kScaffoldBackgroundColor,
      child: Switch(
        value: false,
        onChanged: (bool val){
          // box.put('darkMode', !darkMode);
        },
      ),
    );
  }
}