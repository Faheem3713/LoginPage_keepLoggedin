import 'package:flutter/material.dart';
import 'package:loger/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? Login() : MyCard(),
      checkerboardOffscreenLayers: false,
    ),
  );
}
